/// A session at the conference.
///
/// A session consists of multiple entries.
public struct Session: Equatable, Codable {
	
	/// The title of the presentation.
	///
	/// This corresponds to `session_title`.
	public let title: String?
	
	/// The room where it happens.
	///
	/// This corresponds to `session_room`.
	public let room: String
	
	public init(title: String? = nil, room: String) {
		self.room = room
		
		guard let title,
					title != "" else {
			self.title = nil
			return
		}

		if let english = germanToEnglishSessionNames[title],
			english != title {
			self.title = title + "<br>" + english
		} else {
			self.title = title
		}
	}
}

// MARK: - English Session Names

let germanToEnglishSessionNames: [String: String] = [
	"AG Lehrbeauftragte": "GMTH Working Group Lecturers",
	"AG Musikunterricht": "AG Musikunterricht",
	"AG Internationales": "GMTH Working Group International Relations",
	"Keynotes 1: Lecture-Recital Hardy Rittner": "Keynotes 1: Lecture-Recital Hardy Rittner",
	"Keynotes 1: Peter Dejans und Ludwig Holtmeier, Diskussion": "Keynotes 1: Peter Dejans and Ludwig Holtmeier, Discussion",
	"Lecture-Performances I": "Lecture-Performances I",
	"Reicha und Louis/Thuille": "Reicha and Louis/Thuille",
	"Digitalisierung und Methodik I": "Digitalization and Methodology I",
	"18. Jahrhundert: Komponieren und Interpretieren": "18th Century Music: Composition and Interpretation",
	"Musiktheorie und Schule/Diversität": "Music Theory and Schooling/Diversity",
	"Tonartenaffekte/Zeit und Tempo": "Key Characteristics/Time and Tempo",
	"Workshop: Mikrotonales Komponieren": "Workshop: Microtonality",
	"Workshop DORICO I": "Workshop DORICO I",
	"Lecture-Performances II": "Lecture-Performances II",
	"Didaktik und Methodik der Musiktheorie und Gehörbildung": "Didactics and Methodology of Music Theory and Ear Training",
	"Digitalisierung und Methodik II": "Digitalization and Methodology II",
	"Improvisieren/Alte Musik": "Improvisation/Early Music",
	"Neue und zeitgenössische Musik I": "Contemporary Music I",
	"Instrumentation und Interpretation": "Instrumentation and Interpretation",
	"Keynotes 2: Ariane Jeßulat and Monika Herzig": "Keynotes 2: Ariane Jeßulat and Monika Herzig",
	"Handwerk und Stilkopie": "Artisanship and Imitation of Historic Styles",
	"Unterrichtsforschung Pariser Conservatoire (Panel)": "Teaching Research Paris Conservatory (Panel)",
	"Jazz- und Popularmusik I": "Jazz and Popular Music I",
	"Film- und Popularmusik/Außereuropäische Musik": "Film and Popular Music/Non-European Music",
	"Workshop: Open Access Publizieren": "Workshop: Open Access Publications",
	"Workshop DORICO II": "Workshop DORICO II",
	"Künstlerische Forschung I": "Artistic Research I",
	"Künstlerische Forschung II": "Artistic Research II",
	"Musik des 19. und frühen 20. Jahrhunderts": "19th and Early 20th Century Music",
	"Musikpädagogik und Musiktheorie (Panel)": "Music Pedagogics and Music Theory (Panel)",
	"New Formenlehre und Ästhetik": "New Formenlehre and Aesthetics",
	"Workshop: Modellbasierte Korpusforschung": "Workshop: Model-based Corpus Research",
	"Dualismus und Neo-Riemannian Theory": "Dualism and Neo-Riemannian Theory",
	"Workshop: Professional Development": "Workshop: Professional Development",
	"Jazz- und Popularmusik II": "Jazz and Popular Music II",
	"Musiktheorie des 17. und 18. Jahrhundert": "17th and 18th Century Music Theory",
	"Neue und zeitgenössische Musik II": "Contemporary Music II",
	"Musik und Bewegung": "Music and Motion",
]
