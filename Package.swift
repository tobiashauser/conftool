// swift-tools-version:5.8

import PackageDescription

let package = Package(
	name: "cli-template",
	platforms: [.macOS(.v13)],
	products: [
		.executable(
			name: "CLI",
			targets: ["CLI"]),
		
		.library(
			name: "Core",
			targets: ["Core"]),
	],
	dependencies: [
		.package(url: "https://github.com/apple/swift-argument-parser.git", .upToNextMajor(from: "1.0.0")),
		.package(url: "https://github.com/pointfreeco/swift-custom-dump", branch: "main"),
		.package(url: "https://github.com/JohnSundell/files.git", .upToNextMajor(from: "4.0.0")),
		.package(path: "/Users/tobiashauser/Binder/40-49 Projects/42 Programmieren/42.32 swift-cadenza/swift-cadenza"),
		.package(url: "https://github.com/pointfreeco/swift-html", from: "0.4.0"),
		.package(url: "https://github.com/pointfreeco/swift-web", branch: "master"),
		.package(url: "https://github.com/swiftcsv/SwiftCSV.git", from: "0.8.0"),
		.package(url: "https://github.com/YusukeHosonuma/SwiftPrettyPrint", from: "1.2.0"),
	],
	targets: [
		.executableTarget(
			name: "CLI",
			dependencies: [
				.product(name: "ArgumentParser", package: "swift-argument-parser"),
				.product(name: "Cadenza", package: "swift-cadenza"),
				"Core",
				.product(name: "Files", package: "Files"),
				.product(name: "SwiftPrettyPrint", package: "SwiftPrettyPrint"),
				.product(name: "SwiftCSV", package: "SwiftCSV"),
			]),
		
		.target(
			name: "Core",
			dependencies: [
				.product(name: "Cadenza", package: "swift-cadenza"),
				.product(name: "Css", package: "swift-web"),
				.product(name: "Files", package: "Files"),
				.product(name: "Html", package: "swift-html"),
				.product(name: "HtmlCssSupport", package: "swift-web"),
				.product(name: "SwiftPrettyPrint", package: "SwiftPrettyPrint"),
				.product(name: "SwiftCSV", package: "SwiftCSV"),
			],
			resources: [.process("script.js")]
		),
		.testTarget(
			name: "CoreTests",
			dependencies: [
				"Core",
				.product(name: "CustomDump", package: "swift-custom-dump")
			]),
	]
)
