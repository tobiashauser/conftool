import Foundation

/// A link in the header to the first entry after the given time.
public struct Link {
	public let time: Date
	
	/// String to format the date for the label.
	public let label: String
	
	/// The locale to use.
	public let locale: Locale
	
	/// Extra trailing whitespace. Needs to be HTML size.
	public let trailing: String
	
	var formatted: String {
		self.time.toString(format: .custom(self.label), locale: self.locale)!
	}
	
	public init(time: Date, label: String, locale: Locale, trailing: String) {
		self.time = time
		self.label = label
		self.locale = locale
		self.trailing = trailing
	}
}
