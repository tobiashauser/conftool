import Files
import Foundation

public func script() throws -> String {
	let filePath = Bundle.module.path(forResource: "script", ofType: "js")
	return try File(path: filePath!).readAsString()
}
