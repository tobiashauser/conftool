import ArgumentParser
import Cadenza
import Core
import Files
import Foundation
import SwiftPrettyPrint
import SwiftCSV
import System

//Pretty.sharedOption = Pretty.Option(colored: true)

/// Code for the command line interface. More information at
/// [GitHub](https://github.com/apple/swift-argument-parser).

struct Main: ParsableCommand {
	static let configuration: CommandConfiguration = .init(
		commandName: "conftool",
		abstract: """
			Build itineraries from conftool data.
			
			For the biograpies, export `Alle Autor*innen mit Beiträgen` with all boxes ticked.
			Equally export `Exportiere Sitzungen` with all the boxes ticked for the abstracts.
			
			Don't forget to export as a csv-file. Please choose `;` as the delimiter.

			Define the times which the header should link to in a CSV-file with the form:

			time;label
			2023-09-23 9:00; EEEE, HH:mm |
			2023-09-23 14:30; HH:mm

			It is possible to define additional entries in much the same way. Create another
			csv-file – with headers!. The columns for "title", "starttime", "endtime" and "location"
			must be filled in. Additionally you can specify "type", "abstract", "biography" and
			"sessionTitle". Authors are not possible to declare.

			Furthermore, you can associate colors with the various session types in a csv-file
			as well. Otherwise random colors will be chosen.

			type;color;
			Musik des 19. und frühen 20. Jahrhunderts;#6fa9bd
			""",
		usage: "conftool <biographies.csv> <abstracts.csv>",
		subcommands: [Add.self]
	)

	@Argument(
		help: "The csv-file containing the biographies.",
		completion: .file(extensions: ["csv"])
	)
  var biographies: String
	
	@Argument(
		help: "The csv-file containing the abstracts.",
		completion: .file(extensions: ["csv"])
	)
	var abstracts: String
	
	@Option(
		help: "Csv-file containing additional entries for the itinerary.",
		completion: .file(extensions: ["csv"])
	)
	var additions: String?
	
	@Option(
		help: "Csv-file defining which times should be linked in the header.",
		completion: .file(extensions: ["csv"])
	)
	var links: String?
	
	@Option(
		help: "Csv-file mapping colors to the various session types.",
		completion: .file(extensions: ["csv"])
	)
	var colors: String?
	
	@Option(
		help: "The region-code used to format the dates. Defaults to autoUpdatingCurrent.",
		completion: .list(["de", "en", "fr"])
	)
	var locale: String?
	
	@Flag(name: .shortAndLong, help: "Print any failing messages.")
	var verbose: Bool = false
	
	func run() throws {
		do {
			let url: (String) -> URL = { path in
				tuple
				․ path
				․ URL.init ~ FileManager().currentDirectoryPath
				|> URL.init
			}
			
			let load: (String) throws -> NamedCSV = { path in
				try tuple3
				․ url ~ path
				․ String.Encoding.utf8
				․ true
				|> NamedCSV.init
			}
			
			let biographies: NamedCSV = try biographies |> load
			let abstracts: NamedCSV = try abstracts |> load
			
			var localeData: Locale = .current
			if let locale {
				if Locale.availableIdentifiers.contains(locale) {
					localeData = Locale(identifier: locale)
				} else {
					if verbose {
						print("The region '\(locale)' is not a valid identifier. Falling back to the current locale.")
					}
				}
			}
			
			var colorData: [String: String] = [:]
			if let colors {
				let colors = try EnumeratedCSV(url: colors |> url)
				
				for row in colors.rows {
					guard colors.columns?.count ?? 0 > 1
					else { if verbose { print("Colors - Not enough columns.") }; continue }
					
					colorData[row[0]] = row[1]
				}
			}
			
			var additionalEntries: [Entry] = []
			if let additions {
				let additions = try additions |> load
				
				for addition in additions.rows {
					guard let title = addition["title"],
								let starttime = addition["starttime"] |> flatMap § Date.init,
								let endtime = addition["endtime"] |> flatMap § Date.init,
								let location = addition["location"]
					else { if verbose { print("Couldn't parse \(addition).") }; continue }
					
					let entry = Entry(
						id: UUID().hashValue,
						starttime: starttime,
						endtime: endtime,
						title: title,
						type: addition["type"] != "" ? addition["type"] : nil,
						abstract: addition["abstract"] != "" ? addition["abstract"] : nil,
						biography: addition["biography"] != "" ? addition["biography"] : nil,
						authors: nil,
						session: Session(
							title: addition["sessionTitle"] != "" ? addition["sessionTitle"] : nil,
							room: location
						),
						locale: localeData,
						color: colorData[addition["type"] ?? "fjdksl;a"]
					)
					additionalEntries.append(entry)
				}
			}
			
			let (entries, failing) = Core.data(biographies, abstracts, locale: localeData, colors: colorData)
			
			let cwd = try Folder(path: FileManager().currentDirectoryPath)
			let output = try cwd.createSubfolderIfNeeded(withName: "output")
			
			let index = try output.createFileIfNeeded(withName: "index.html")
			let styles = try output.createFileIfNeeded(withName: "styles.css")
			let script = try output.createFileIfNeeded(withName: "script.js")
			
			var linkData: [Link] = []
			if let links {
				let links = try EnumeratedCSV(url: links |> url)
				for row in links.rows {
					guard row.count > 1 else {
						if verbose { print("Links - a row doesn't have enough columns.") }
						continue
					}
					if let time = Date(detectFromString: row[0]) {
						guard time.toString(format: .custom(row[1])) != nil
						else { print("Links - couldn't print label: \(row[1])"); continue }
						let trailing = row.count > 2 ? row[2] : ""
						linkData.append(Link(time: time, label: row[1], locale: localeData, trailing: trailing))
					} else {
						if verbose {
							print("Links - couldn't parse date: \(row[0])")
						}
					}
				}
			}
			
			try index.write(
				Core.html(
					for: sort(
						entries + additionalEntries
//						mockEntries
				),
				with: linkData)
			)
			try styles.write(Core.styles())
			try script.write(Core.script())
			
			print("Created website at '\(index.path)'.")
			print("Accepted \(entries.count + additionalEntries.count) entries | Rejected \(failing.count)")
			if verbose {
				print("")
				print(
					failing
						.map { $0.joined(separator: "\n") }
						.joined(separator: "\n")
				)
			}
		} catch {
			print(error)
		}
  }
}

struct Add: ParsableCommand {
	static let configuration: CommandConfiguration = .init(
		commandName: "add",
		abstract: "Create a file where custom entries for the itinerary can be defined.",
		usage: "confplan add <name.csv>"
	)
	
	@Argument(help: "The name of the file. The suffix `csv` will be added automatically.")
	var name: String
	
	func run() throws {
		// TODO: implement
		print("TODO: implement")
	}
}

Main.main()

// MARK: - HELPER

func sort(_ entries: [Entry]) -> [Entry] {
	return entries.sorted {
		if $0.starttime == $1.starttime {
			return $0.session.room <= $1.session.room
		} else {
			return $0.starttime < $1.starttime
		}
	}
}

