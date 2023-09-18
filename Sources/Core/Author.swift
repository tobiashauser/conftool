/// A persion giving a presentation.
public struct Author: Equatable, Codable {
	
	/// The first name fo the persion.
	///
	/// This corresponds to `author_firstname`.
	public let firstname: String
	
	/// The last name of the persion.
	///
	/// This corresponds to `author_lastname`.
	public let lastname: String
	
	/// The organisation the persion belongs to.
	///
	/// This corresponds to `author_organisation`.
	public let organisation: String?
	
	/// The caption information of the author.
	///
	/// Julia Lorenz • HfM Freiburg Studentin, Deutschland
	var formatted: String {
		self.firstname
		+ " "
		+ self.lastname
		+ (
			self.organisation == nil
			? ""
			: " • " + self.organisation!
		)
	}
	
	public init(firstname: String, lastname: String, organisation: String? = nil) {
		self.firstname = firstname
		self.lastname = lastname
		self.organisation = organisation != "" ? organisation : nil
	}
	
	/// The full name of the author.
	public var fullName: String {
		self.firstname + " " + self.lastname
	}
}
