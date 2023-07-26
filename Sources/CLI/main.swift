import ArgumentParser
import Cadenza
import Core
import Files
import Foundation
import SwiftCSV
import System

/// Code for the command line interface. More information at
/// [GitHub](https://github.com/apple/swift-argument-parser).

struct Main: ParsableCommand {
	static let configuration: CommandConfiguration = .init(
		commandName: "confplan",
		abstract: """
			Build itineraries from conftool data.
			
			For the biograpies, export `Alle Autor*innen mit Beiträgen` with all boxes ticked.
			Equally export `Exportiere Sitzungen` with all the boxes ticked for the abstracts.
			
			Don't forget to export as a csv-file. Please choose `;` as the delimiter.
			""",
		usage: "confplan <biographies.csv> <abstracts.csv>",
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
	
	@Argument(
		help: "Optional csv-file containing additional entries for the itinerary.",
		completion: .file(extensions: ["csv"])
	)
	var additions: String?
	
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
