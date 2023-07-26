import Cadenza
import SwiftCSV

// NamedCSV -> Entry
// [String: String]  <- row

let fields: [String] = [
	"paperID"
]

func extract(_ key: String, from dict: [String: String]) -> Result<String, String> {
	if let value = dict[key] {
		return .success(value)
	} else {
		return .failure("Couldn't extract a value for the key '\(key)'.")
	}
}

extension [String]: Error {}
extension String: Error {}
