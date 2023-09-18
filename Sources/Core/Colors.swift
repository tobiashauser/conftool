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
