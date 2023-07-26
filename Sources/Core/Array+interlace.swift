extension Array {
	func interlace(_ element: Element) -> Self {
		Array(self.map(CollectionOfOne.init).joined(separator: CollectionOfOne(element)))
	}
}
