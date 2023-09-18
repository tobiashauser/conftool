import Css
import Foundation

/// An entry at the congress.
///
/// Loosely corresponds to a 'paper' in conftool jargon.
public struct Entry: Equatable {
	
	/// The id of the presentation.
	///
	/// This corresponds to the `paper_ID` in `cvs.csv` and
	/// `p[1-4]_paperID` in `abstracts.csv`.
	///
	/// The IDs are not guaranteed to be unique. Every author
	/// has their own row in the csv-file, hence some properties
	/// must be accumulated while others are guaranteed the same.
	public let id: Int
	
	/// The start of the presentation.
	///
	/// This corresponds to `presentation_starttime`.
	public var starttime: Date
	
	/// The end of the presentation.
	///
	/// This corresponds to `presentation_endtime`.
	public var endtime: Date
	
	/// The title of the presentation.
	///
	/// This corresponds to `paper_title`.
	public let title: String
	
	/// The type of the presentation.
	///
	/// This corresponds to `paper_contribution_type`.
	public let type: String?
	
	/// The abstract of the presentation.
	///
	/// This corresponds to `p[1-4]_abstract` in `abstracts.csv`.
	/// It is HTML.
	public var abstract: String?
	
	/// The biography for a session.
	///
	/// This corresponds to `presenting_author_cv`.
	///
	/// Conftool associates biographies with sessions. Hence not every
	/// row (representing an author) in `cvs.csv` has a biography in
	/// case of a collaboration.
	///
	/// Hence, this value must be accumulated from all the rows.
	public var biography: String?
	
	/// The people given the presentation.
	public var authors: [Author]?
	
	/// The session in which the presentation happens.
	public let session: Session
	
	/// The local used to format the dates.
	let locale: Locale
	
	/// The callout information for the session.
	///
	/// Freitag, 23. September, 14:30 - 14:55 • Raum 101
	public var callout: String {
		self.starttime.toString(format: .custom("EEEE, dd. MMMM"), locale: .init(identifier: "de"))!
		+ ", "
		+ self.starttime.toString(format: .custom("HH:mm"), locale: .init(identifier: "de"))!
		+ " - "
		+ self.endtime.toString(format: .custom("HH:mm"), locale: .init(identifier: "de"))!
		+ " • "
		+ self.session.room
	}
	
	/// The caption information of the author.
	///
	/// Julia Lorenz • HfM Freiburg Studentin, Deutschland
	/// Alfred Molina • HfM Freiburg, Deutschland
	public var caption: String? {
		self.authors?.map(\.formatted).joined(separator: "<br>")
	}
	
	public var color: String
	
	public init(
		id: Int,
		starttime: Date,
		endtime: Date,
		title: String,
		type: String? = nil,
		abstract: String? = nil,
		biography: String? = nil,
		authors: [Author]? = nil,
		session: Session,
		locale: Locale,
		color: String? = nil
	) {
		self.id = id
		self.starttime = starttime
		self.endtime = endtime
		self.title = title
		self.type = type != "" ? type : nil
		self.abstract = abstract != ""
		&& abstract != "<p>[Abstract]</p>\n"
		&& abstract != "<p>[Abstract folgt]</p>\n"
		? abstract
		: nil
		self.biography = biography != "" ? biography : nil
		self.authors = authors != [] ? authors : nil
		self.session = session
		self.locale = locale
		self.color = color ?? randomColors.randomElement()!// randomColors.chooseNew(&lastColor)
	}
}

// MARK: - Colors

let randomColors: [String] = [
	"#001865", // GMTH blau
	"#E20011",  // Mh freiburg rot
	"#EFAC09", // yellow
	"#831BC2",  // purple
	"#980E91",  // violet rose
	"#54DDDA",  // türkis
	"#ffb1b6",  // lachs
]

var lastColor = randomColors[0]

extension Array where Element: Equatable {
	func chooseNew(_ store: inout Element) -> Element {
		var random = self.randomElement()!
		while random == store {
			random = self.randomElement()!
		}
		store = random
		return random
	}
}
