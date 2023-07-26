import Cadenza
import Foundation
import SwiftCSV
import SwiftPrettyPrint


extension [String]: Error {}
extension String: Error {}


/// The fields needed from the csv-table biographies.
///
/// DON'T CHANGE
public let biographyFields: Set<String> = [
	"acceptance",
	"paperID",
	"paper_title",
	"paper_contribution_type",
	"presenting_author_cv",
	"session_title",
	"session_room",
	"author_firstname",
	"author_lastname",
	"author_organisation",
]

/// The fields needed from the csv-table abstracts.
///
/// DON'T CHANGE
public let abstractFields: Set<String> = [
	"abstract",
	"start",
	"end",
]


public func data(
	_ biographies: NamedCSV,
	_ abstracts: NamedCSV,
	locale: Locale,
	colors: [String: String]) -> ([Entry],
	[[String]]
) {
	var count = 0
	var rowContents: [Result<Entry, [String]>] = []
	
	for row in biographies.rows {
		defer { count += 1 }
		let entry = biographyFields
			.map(curry ~ extract)
			.map { $0(row) }
		|> Dictionary.init
		|> addFromAbstracts(abstracts)
		• validate("start") { Date(detectFromString: $0) != nil }
		• validate("end") { Date(detectFromString: $0) != nil }
		|> createEntry(locale: locale, colors: colors)
		
		combineOrAppend(entry, to: &rowContents)
	}
	
	var entries: [Entry] = []
	var failing: [[String]] = []
	
	for item in rowContents {
		switch item {
			case .success(let success):
				entries.append(success)
			case .failure(let failure):
				failing.append(failure)
		}
	}
	
	return (entries, failing)
}


func combineOrAppend(_ entry: Result<Entry, [String]>, to entries: inout [Result<Entry, [String]>]) {
	switch entry {
		case .success(let success):
			if let idx = entries.firstIndex(where: {
				switch $0 {
					case .success(let item):
						return item.id == success.id
					case .failure:
						return false
				}
			}) {
				guard case var .success(old) = entries[idx]
				else { fatalError() }
				old.authors! += success.authors ?? []
				if old.abstract == "" {
					old.abstract = success.abstract
				}
				entries[idx] = .success(old)
			} else {
				entries.append(entry)
			}
			
		case .failure:
			if !entries.contains(entry) {
				entries.append(entry)
			}
	}
}


func validate(_ value: Result<String, String>?, accumulatingError: inout [String]) -> String? {
	switch value {
		case .none:
			return nil
		case let .some(.failure(error)):
			accumulatingError.append(error)
			return nil
		case let .some(.success(value)):
			return value
	}
}


func createEntry(locale: Locale, colors: [String: String]) -> ([String : Result<String, String>]) -> Result<Entry, [String]> {
	return { values in
		guard case values["acceptance"] = Result<String, String>.success("Accepted") else {
			var errors: [String] = []
			if let title = validate(values["paper_title"], accumulatingError: &errors),
				 let firstname = validate(values["author_firstname"], accumulatingError: &errors),
				 let lastname = validate(values["author_lastname"], accumulatingError: &errors) {
				return .failure(["Rejected: \(firstname) \(lastname), \(title)"])
			}
			else {
				fatalError()
			}
		}
		
		var errors: [String] = []
		guard let id = validate(values["paperID"], accumulatingError: &errors) |> flatMap § Int.init,
					let starttime = validate(values["start"], accumulatingError: &errors) |> flatMap § Date.init,
					let endtime = validate(values["end"], accumulatingError: &errors) |> flatMap § Date.init,
					let title = validate(values["paper_title"], accumulatingError: &errors),
					let type = validate(values["paper_contribution_type"], accumulatingError: &errors),
					let abstract = validate(values["abstract"], accumulatingError: &errors),
					let biography = validate(values["presenting_author_cv"], accumulatingError: &errors),
					let firstName = validate(values["author_firstname"], accumulatingError: &errors),
					let lastName = validate(values["author_lastname"], accumulatingError: &errors),
					let organisation = validate(values["author_organisation"], accumulatingError: &errors),
					let sessionTitle = validate(values["session_title"], accumulatingError: &errors),
					let sessionRoom = validate(values["session_room"], accumulatingError: &errors)
		else { return .failure(errors) }
		
		return .success(
			Entry(
				id: id,
				starttime: starttime,
				endtime: endtime,
				title: title,
				type: type,
				abstract: abstract,
				biography: biography,
				authors: [Author(firstname: firstName, lastname: lastName, organisation: organisation)],
				session: Session(title: sessionTitle, room: sessionRoom),
				locale: locale,
				color: colors[type] ?? randomColors.chooseNew(&lastColor)
			)
		)
	}
}


func validate(_ key: String, with f: @escaping (String) -> Bool)
-> ([String : Result<String, String>])
-> [String : Result<String, String>]
{
	return { values in
		var values = values
		if let result = values[key] {
			switch result {
				case let .success(value):
					if !f(value) {
						values[key] = .failure("Invalid value for '\(key)'.")
					}
				case .failure:
					break
			}
		}
		return values
	}
}

func addFromAbstracts(_ abstracts: NamedCSV) -> ([String: Result<String, String>]) -> [String: Result<String, String>] {
	return { biographyValues in
		var biographyValues = biographyValues
		
		for row in abstracts.rows {
			var count = 1
			while let id = row |> extractID(abstractKey("paperID", for: count)) {
				defer { count += 1 }
				if id == biographyValues |> extractID  {
					let abstractValues = abstractFields
						.map(count |> flip ~ curry ~ extractFromAbstract)
						.map { $0(row) }
					|> Dictionary.init
		
					biographyValues.merge(abstractValues) { (current, _) in current }
				}
			}
		}
		return biographyValues
	}
}


func extractFromAbstract(_ key: String, count: Int, from dict: Named.Row) -> (String, Result<String, String>) {
	if let value = dict[abstractKey(key, for: count)] {
		return (key, .success(value))
	} else {
		return (key, .failure("Couldn't extract a value for the key '\(key)'."))
	}
}


func extract(_ key: String, from dict: Named.Row) -> (String, Result<String, String>) {
	if let value = dict[key] {
		return (key, .success(value))
	} else {
		return (key, .failure("Couldn't extract a value for the key '\(key)'."))
	}
}


func abstractKey(_ key: String, for count: Int) -> String {
	"p\(count)_\(key)"
}


func extractID(_ key: String) -> (Named.Row) -> Int? {
	return { row in
		if let idString = row[key],
			 let id = Int(idString) {
			return id
		} else {
			return nil
		}
	}
}


func extractID(_ row: [String: Result<String, String>]) -> Int? {
	switch row["paperID"] {
		case .none:
			return nil
		case .some(.failure):
			return nil
		case let .some(.success(value)):
			return Int(value)
	}
}
