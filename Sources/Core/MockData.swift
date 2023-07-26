import Foundation

// MARK: Mocks

let lorenz = Entry(
	id: 1,
	starttime: Date().advanced(by: -60*60*24),
	endtime: Date().advanced(by: -60*60*24+61*25),
	title: "Tonartenaffekte: eine musikalisch-praktische Perspektive",
	abstract: "<p>Die Zuschreibung von Affekten zu bestimmten Tonarten wird im 18. Jahrhundert, wie auch schon im vorhergehenden überlieferten musikgeschichtlichen Diskurs, kontroversiell diskutiert – man bedenke etwa die widersprüchliche Behandlung des Themas in Traktaten Matthesons und Heinichens.</p><p> Die Einnahme einer künstlerisch-praktischen Perspektive auf das Konzept der Tonartenaffekte bietet die Möglichkeit, unabhängig von einer qualitativen Wertung des Konzeptes die Frage zu stellen, inwiefern sich verschiedene Tonarten akustisch voneinander unterscheiden.</p> <p> Im Bereich des historisch informierten praktischen Musizierens finden sich Aspekte, die einen Einfluss auf das klangliche Erscheinungsbild einer Tonart ausüben. Offene Saiten von Streichinstrumenten, die Temperatur von Tasteninstrumenten sowie instrumentenspezifische Zuordnungen zu Tonarten, wie im Fall der Pauken und Trompeten, tragen zu einer differenzierten Klanglichkeit von Tonarten bei. Das klangliche Erscheinungsbild einer Tonart bietet häufig die Grundlage für die Entwicklung einer assoziativen Tonartensymbolik, die auch unabhängig von der konkreten Besetzung eines Musikstücks ihre Gültigkeit behält. In meinem Vortrag möchte ich die genannten musikalisch-praktischen Aspekte vorstellen und ihren Einfluss anhand von Kompositionen des frühen 18. Jahrhunderts beispielhaft untersuchen. </p>",
	biography: "Julia Lorenz studierte grundständig Kirchenmusik, Schulmusik und Germanistik. Aktuell studiert sie im Master Kirchenmusik und Historische Aufführungspraxis mit Hauptfach Generalbass. Ihr Interesse gilt insbesondere Fragen der historisch informierten Aufführungspraxis des frühen 18. Jahrhunderts.",
	authors: [Author(firstname: "Julia", lastname: "Lorenz", organisation: "HfM Freiburg Studentin, Deutschland")],
	session: Session(title: "Tonartenaffekte/Zeit und Tempo", room: "Raum 101"),
	locale: Locale(identifier: "de")
)

let lorenz2 = Entry(
	id: 2,
	starttime: Date().advanced(by: -60*25),
	endtime: Date(),
	title: "Tonartenaffekte: eine musikalisch-praktische Perspektive",
	authors: [Author(firstname: "Julia", lastname: "Lorenz", organisation: "HfM Freiburg Studentin, Deutschland")],
	session: Session(title: "Tonartenaffekte/Zeit und Tempo", room: "Raum 101"),
	locale: Locale(identifier: "de")
)

let lorenz3 = Entry(
	id: 3,
	starttime: Date(),
	endtime: Date().advanced(by: 60*25),
	title: "Tonartenaffekte: eine musikalisch-praktische Perspektive",
	biography: "",
	session: Session(room: "Raum 101"),
	locale: Locale(identifier: "de")
)

let lorenz4 = Entry(
	id: 4,
	starttime: Date().advanced(by: 60*5),
	endtime: Date().advanced(by: 60*30),
	title: "Tonartenaffekte: eine musikalisch-praktische Perspektive",
	type: "Individual Lecture",
	abstract: "<p>Die Zuschreibung von Affekten zu bestimmten Tonarten wird im 18. Jahrhundert, wie auch schon im vorhergehenden überlieferten musikgeschichtlichen Diskurs, kontroversiell diskutiert – man bedenke etwa die widersprüchliche Behandlung des Themas in Traktaten Matthesons und Heinichens. Die Einnahme einer künstlerisch-praktischen Perspektive auf das Konzept der Tonartenaffekte bietet die Möglichkeit, unabhängig von einer qualitativen Wertung des Konzeptes die Frage zu stellen, inwiefern sich verschiedene Tonarten akustisch voneinander unterscheiden. Im Bereich des historisch informierten praktischen Musizierens finden sich Aspekte, die einen Einfluss auf das klangliche Erscheinungsbild einer Tonart ausüben. Offene Saiten von Streichinstrumenten, die Temperatur von Tasteninstrumenten sowie instrumentenspezifische Zuordnungen zu Tonarten, wie im Fall der Pauken und Trompeten, tragen zu einer differenzierten Klanglichkeit von Tonarten bei. Das klangliche Erscheinungsbild einer Tonart bietet häufig die Grundlage für die Entwicklung einer assoziativen Tonartensymbolik, die auch unabhängig von der konkreten Besetzung eines Musikstücks ihre Gültigkeit behält. In meinem Vortrag möchte ich die genannten musikalisch-praktischen Aspekte vorstellen und ihren Einfluss anhand von Kompositionen des frühen 18. Jahrhunderts beispielhaft untersuchen. </p>",
	biography: "Julia Lorenz studierte grundständig Kirchenmusik, Schulmusik und Germanistik. Aktuell studiert sie im Master Kirchenmusik und Historische Aufführungspraxis mit Hauptfach Generalbass. Ihr Interesse gilt insbesondere Fragen der historisch informierten Aufführungspraxis des frühen 18. Jahrhunderts.",
	authors: [Author(firstname: "Julia", lastname: "Lorenz", organisation: "HfM Freiburg Studentin, Deutschland")],
	session: Session(title: "Tonartenaffekte/Zeit und Tempo", room: "Raum 101"),
	locale: Locale(identifier: "de")
)

let lorenz5 = Entry(
	id: 5,
	starttime: Date().advanced(by: 60*60*24),
	endtime: Date().advanced(by: 60*60*24+60*25),
	title: "Tonartenaffekte: eine musikalisch-praktische Perspektive",
	type: "Individual Lecture",
	abstract: "<p>Die Zuschreibung von Affekten zu bestimmten Tonarten wird im 18. Jahrhundert, wie auch schon im vorhergehenden überlieferten musikgeschichtlichen Diskurs, kontroversiell diskutiert – man bedenke etwa die widersprüchliche Behandlung des Themas in Traktaten Matthesons und Heinichens. Die Einnahme einer künstlerisch-praktischen Perspektive auf das Konzept der Tonartenaffekte bietet die Möglichkeit, unabhängig von einer qualitativen Wertung des Konzeptes die Frage zu stellen, inwiefern sich verschiedene Tonarten akustisch voneinander unterscheiden. Im Bereich des historisch informierten praktischen Musizierens finden sich Aspekte, die einen Einfluss auf das klangliche Erscheinungsbild einer Tonart ausüben. Offene Saiten von Streichinstrumenten, die Temperatur von Tasteninstrumenten sowie instrumentenspezifische Zuordnungen zu Tonarten, wie im Fall der Pauken und Trompeten, tragen zu einer differenzierten Klanglichkeit von Tonarten bei. Das klangliche Erscheinungsbild einer Tonart bietet häufig die Grundlage für die Entwicklung einer assoziativen Tonartensymbolik, die auch unabhängig von der konkreten Besetzung eines Musikstücks ihre Gültigkeit behält. In meinem Vortrag möchte ich die genannten musikalisch-praktischen Aspekte vorstellen und ihren Einfluss anhand von Kompositionen des frühen 18. Jahrhunderts beispielhaft untersuchen. </p>",
	biography: "Julia Lorenz studierte grundständig Kirchenmusik, Schulmusik und Germanistik. Aktuell studiert sie im Master Kirchenmusik und Historische Aufführungspraxis mit Hauptfach Generalbass. Ihr Interesse gilt insbesondere Fragen der historisch informierten Aufführungspraxis des frühen 18. Jahrhunderts.",
	authors: [Author(firstname: "Julia", lastname: "Lorenz", organisation: "HfM Freiburg Studentin, Deutschland")],
	session: Session(title: "Tonartenaffekte/Zeit und Tempo", room: "Raum 101"),
	locale: Locale(identifier: "de")
)
let lorenz6 = Entry(
	id: 6,
	starttime: Date().advanced(by: 60*60*24*2),
	endtime: Date().advanced(by: 60*60*24*2+60*25),
	title: "Tonartenaffekte: eine musikalisch-praktische Perspektive",
	type: "Individual Lecture",
	abstract: "<p>Die Zuschreibung von Affekten zu bestimmten Tonarten wird im 18. Jahrhundert, wie auch schon im vorhergehenden überlieferten musikgeschichtlichen Diskurs, kontroversiell diskutiert – man bedenke etwa die widersprüchliche Behandlung des Themas in Traktaten Matthesons und Heinichens. Die Einnahme einer künstlerisch-praktischen Perspektive auf das Konzept der Tonartenaffekte bietet die Möglichkeit, unabhängig von einer qualitativen Wertung des Konzeptes die Frage zu stellen, inwiefern sich verschiedene Tonarten akustisch voneinander unterscheiden. Im Bereich des historisch informierten praktischen Musizierens finden sich Aspekte, die einen Einfluss auf das klangliche Erscheinungsbild einer Tonart ausüben. Offene Saiten von Streichinstrumenten, die Temperatur von Tasteninstrumenten sowie instrumentenspezifische Zuordnungen zu Tonarten, wie im Fall der Pauken und Trompeten, tragen zu einer differenzierten Klanglichkeit von Tonarten bei. Das klangliche Erscheinungsbild einer Tonart bietet häufig die Grundlage für die Entwicklung einer assoziativen Tonartensymbolik, die auch unabhängig von der konkreten Besetzung eines Musikstücks ihre Gültigkeit behält. In meinem Vortrag möchte ich die genannten musikalisch-praktischen Aspekte vorstellen und ihren Einfluss anhand von Kompositionen des frühen 18. Jahrhunderts beispielhaft untersuchen. </p>",
	biography: "Julia Lorenz studierte grundständig Kirchenmusik, Schulmusik und Germanistik. Aktuell studiert sie im Master Kirchenmusik und Historische Aufführungspraxis mit Hauptfach Generalbass. Ihr Interesse gilt insbesondere Fragen der historisch informierten Aufführungspraxis des frühen 18. Jahrhunderts.",
	authors: [Author(firstname: "Julia", lastname: "Lorenz", organisation: "HfM Freiburg Studentin, Deutschland")],
	session: Session(title: "Tonartenaffekte/Zeit und Tempo", room: "Raum 101"),
	locale: Locale(identifier: "de")
)
let lorenz7 = Entry(
	id: 7,
	starttime: Date().advanced(by: 60*60*24*3),
	endtime: Date().advanced(by: 60*60*24*3+60*25),
	title: "Tonartenaffekte: eine musikalisch-praktische Perspektive",
	type: "Individual Lecture",
	abstract: "<p>Die Zuschreibung von Affekten zu bestimmten Tonarten wird im 18. Jahrhundert, wie auch schon im vorhergehenden überlieferten musikgeschichtlichen Diskurs, kontroversiell diskutiert – man bedenke etwa die widersprüchliche Behandlung des Themas in Traktaten Matthesons und Heinichens. Die Einnahme einer künstlerisch-praktischen Perspektive auf das Konzept der Tonartenaffekte bietet die Möglichkeit, unabhängig von einer qualitativen Wertung des Konzeptes die Frage zu stellen, inwiefern sich verschiedene Tonarten akustisch voneinander unterscheiden. Im Bereich des historisch informierten praktischen Musizierens finden sich Aspekte, die einen Einfluss auf das klangliche Erscheinungsbild einer Tonart ausüben. Offene Saiten von Streichinstrumenten, die Temperatur von Tasteninstrumenten sowie instrumentenspezifische Zuordnungen zu Tonarten, wie im Fall der Pauken und Trompeten, tragen zu einer differenzierten Klanglichkeit von Tonarten bei. Das klangliche Erscheinungsbild einer Tonart bietet häufig die Grundlage für die Entwicklung einer assoziativen Tonartensymbolik, die auch unabhängig von der konkreten Besetzung eines Musikstücks ihre Gültigkeit behält. In meinem Vortrag möchte ich die genannten musikalisch-praktischen Aspekte vorstellen und ihren Einfluss anhand von Kompositionen des frühen 18. Jahrhunderts beispielhaft untersuchen. </p>",
	biography: "Julia Lorenz studierte grundständig Kirchenmusik, Schulmusik und Germanistik. Aktuell studiert sie im Master Kirchenmusik und Historische Aufführungspraxis mit Hauptfach Generalbass. Ihr Interesse gilt insbesondere Fragen der historisch informierten Aufführungspraxis des frühen 18. Jahrhunderts.",
	authors: [Author(firstname: "Julia", lastname: "Lorenz", organisation: "HfM Freiburg Studentin, Deutschland")],
	session: Session(title: "Tonartenaffekte/Zeit und Tempo", room: "Raum 101"),
	locale: Locale(identifier: "de")
)
let lorenz8 = Entry(
	id: 8,
	starttime: Date().advanced(by: 60*60*24*4),
	endtime: Date().advanced(by: 60*60*24*4+60*25),
	title: "Tonartenaffekte: eine musikalisch-praktische Perspektive",
	type: "Individual Lecture",
	abstract: "<p>Die Zuschreibung von Affekten zu bestimmten Tonarten wird im 18. Jahrhundert, wie auch schon im vorhergehenden überlieferten musikgeschichtlichen Diskurs, kontroversiell diskutiert – man bedenke etwa die widersprüchliche Behandlung des Themas in Traktaten Matthesons und Heinichens. Die Einnahme einer künstlerisch-praktischen Perspektive auf das Konzept der Tonartenaffekte bietet die Möglichkeit, unabhängig von einer qualitativen Wertung des Konzeptes die Frage zu stellen, inwiefern sich verschiedene Tonarten akustisch voneinander unterscheiden. Im Bereich des historisch informierten praktischen Musizierens finden sich Aspekte, die einen Einfluss auf das klangliche Erscheinungsbild einer Tonart ausüben. Offene Saiten von Streichinstrumenten, die Temperatur von Tasteninstrumenten sowie instrumentenspezifische Zuordnungen zu Tonarten, wie im Fall der Pauken und Trompeten, tragen zu einer differenzierten Klanglichkeit von Tonarten bei. Das klangliche Erscheinungsbild einer Tonart bietet häufig die Grundlage für die Entwicklung einer assoziativen Tonartensymbolik, die auch unabhängig von der konkreten Besetzung eines Musikstücks ihre Gültigkeit behält. In meinem Vortrag möchte ich die genannten musikalisch-praktischen Aspekte vorstellen und ihren Einfluss anhand von Kompositionen des frühen 18. Jahrhunderts beispielhaft untersuchen. </p>",
	biography: "Julia Lorenz studierte grundständig Kirchenmusik, Schulmusik und Germanistik. Aktuell studiert sie im Master Kirchenmusik und Historische Aufführungspraxis mit Hauptfach Generalbass. Ihr Interesse gilt insbesondere Fragen der historisch informierten Aufführungspraxis des frühen 18. Jahrhunderts.",
	authors: [Author(firstname: "Julia", lastname: "Lorenz", organisation: "HfM Freiburg Studentin, Deutschland")],
	session: Session(title: "Tonartenaffekte/Zeit und Tempo", room: "Raum 101"),
	locale: Locale(identifier: "de")
)
let lorenz9 = Entry(
	id: 9,
	starttime: Date().advanced(by: 60*60*24*5),
	endtime: Date().advanced(by: 60*60*24*5+60*25),
	title: "Tonartenaffekte: eine musikalisch-praktische Perspektive",
	type: "Individual Lecture",
	abstract: "<p>Die Zuschreibung von Affekten zu bestimmten Tonarten wird im 18. Jahrhundert, wie auch schon im vorhergehenden überlieferten musikgeschichtlichen Diskurs, kontroversiell diskutiert – man bedenke etwa die widersprüchliche Behandlung des Themas in Traktaten Matthesons und Heinichens. Die Einnahme einer künstlerisch-praktischen Perspektive auf das Konzept der Tonartenaffekte bietet die Möglichkeit, unabhängig von einer qualitativen Wertung des Konzeptes die Frage zu stellen, inwiefern sich verschiedene Tonarten akustisch voneinander unterscheiden. Im Bereich des historisch informierten praktischen Musizierens finden sich Aspekte, die einen Einfluss auf das klangliche Erscheinungsbild einer Tonart ausüben. Offene Saiten von Streichinstrumenten, die Temperatur von Tasteninstrumenten sowie instrumentenspezifische Zuordnungen zu Tonarten, wie im Fall der Pauken und Trompeten, tragen zu einer differenzierten Klanglichkeit von Tonarten bei. Das klangliche Erscheinungsbild einer Tonart bietet häufig die Grundlage für die Entwicklung einer assoziativen Tonartensymbolik, die auch unabhängig von der konkreten Besetzung eines Musikstücks ihre Gültigkeit behält. In meinem Vortrag möchte ich die genannten musikalisch-praktischen Aspekte vorstellen und ihren Einfluss anhand von Kompositionen des frühen 18. Jahrhunderts beispielhaft untersuchen. </p>",
	biography: "Julia Lorenz studierte grundständig Kirchenmusik, Schulmusik und Germanistik. Aktuell studiert sie im Master Kirchenmusik und Historische Aufführungspraxis mit Hauptfach Generalbass. Ihr Interesse gilt insbesondere Fragen der historisch informierten Aufführungspraxis des frühen 18. Jahrhunderts.",
	authors: [Author(firstname: "Julia", lastname: "Lorenz", organisation: "HfM Freiburg Studentin, Deutschland")],
	session: Session(title: "Tonartenaffekte/Zeit und Tempo", room: "Raum 101"),
	locale: Locale(identifier: "de")
)
let lorenz10 = Entry(
	id: 10,
	starttime: Date().advanced(by: 60*60*24*6),
	endtime: Date().advanced(by: 60*60*24*6+60*25),
	title: "Tonartenaffekte: eine musikalisch-praktische Perspektive",
	type: "Individual Lecture",
	abstract: "<p>Die Zuschreibung von Affekten zu bestimmten Tonarten wird im 18. Jahrhundert, wie auch schon im vorhergehenden überlieferten musikgeschichtlichen Diskurs, kontroversiell diskutiert – man bedenke etwa die widersprüchliche Behandlung des Themas in Traktaten Matthesons und Heinichens. Die Einnahme einer künstlerisch-praktischen Perspektive auf das Konzept der Tonartenaffekte bietet die Möglichkeit, unabhängig von einer qualitativen Wertung des Konzeptes die Frage zu stellen, inwiefern sich verschiedene Tonarten akustisch voneinander unterscheiden. Im Bereich des historisch informierten praktischen Musizierens finden sich Aspekte, die einen Einfluss auf das klangliche Erscheinungsbild einer Tonart ausüben. Offene Saiten von Streichinstrumenten, die Temperatur von Tasteninstrumenten sowie instrumentenspezifische Zuordnungen zu Tonarten, wie im Fall der Pauken und Trompeten, tragen zu einer differenzierten Klanglichkeit von Tonarten bei. Das klangliche Erscheinungsbild einer Tonart bietet häufig die Grundlage für die Entwicklung einer assoziativen Tonartensymbolik, die auch unabhängig von der konkreten Besetzung eines Musikstücks ihre Gültigkeit behält. In meinem Vortrag möchte ich die genannten musikalisch-praktischen Aspekte vorstellen und ihren Einfluss anhand von Kompositionen des frühen 18. Jahrhunderts beispielhaft untersuchen. </p>",
	biography: "Julia Lorenz studierte grundständig Kirchenmusik, Schulmusik und Germanistik. Aktuell studiert sie im Master Kirchenmusik und Historische Aufführungspraxis mit Hauptfach Generalbass. Ihr Interesse gilt insbesondere Fragen der historisch informierten Aufführungspraxis des frühen 18. Jahrhunderts.",
	authors: [Author(firstname: "Julia", lastname: "Lorenz", organisation: "HfM Freiburg Studentin, Deutschland")],
	session: Session(title: "Tonartenaffekte/Zeit und Tempo", room: "Raum 101"),
	locale: Locale(identifier: "de")
)


public let mockEntries: [Entry] = [lorenz, lorenz2, lorenz3, lorenz4, lorenz5, lorenz6, lorenz7, lorenz8, lorenz9, lorenz10]
