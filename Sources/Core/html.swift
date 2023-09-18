import Cadenza
//import Css
import Foundation
import Html
//import HtmlCssSupport

// without debugRender I cannot inject html

public func html(for data: [Entry], with links: [Link]) -> String {
	debugRender(htmlDocument(data, links))
}

func htmlDocument(_ data: [Entry], _ links: [Link]) -> Node {
	.document(
		.html(
			head()
			, body(data, links)
		)
	)
}

func head() -> ChildOf<Tag.Html> {
	.head(
		.link(attributes: [.rel(.stylesheet), .href("styles.css")])
		, .script(attributes: [.src("script.js")])
		, .meta(viewport: .width(.deviceWidth))
		, .meta(attributes: [.charset(.utf8)])
	)
}

func body(_ data: [Entry], _ links: [Link]) -> ChildOf<Tag.Html> {
	.body(
		attributes: [.onload(safe: "performOnload()")],
		header(data, links)
		, entries(data)
	)
}

func header(_ data: [Entry], _ links: [Link]) -> Node {
	.div(
		attributes: [.class("header")],
		.fragment(links |> map § curry ~ headerLink § data)
		, headerNow()
	)
}

func headerLink(_ data: [Entry], _ link: Link) -> Node {
	if let target = data.first(where: { entry in
		entry.starttime >= link.time
	}) {
		return .div(
			attributes: [
				.class("button headerItem")
				, .style(unsafe: "margin-right: \(link.trailing);")
				, .onclick(unsafe: "scrollToElementWith('\(id(target.id, "entry"))')")
			],
			.text("\(link.formatted)")
		)
	} else {
		return .div("")
	}
}

func headerNow() -> Node {
	.div(
		attributes: [
			.class("push button")
		, .onclick(safe: "scrollToNow()")
		],
		"Jetzt"
	)
}

func entries(_ data: [Entry]) -> Node {
	.div(
		.fragment((data |> map § entry).interlace(.hr))
	)
}

func entry(_ data: Entry) -> Node {
	.div(
		attributes: [
			.class("entry")
			, .data("time", data.starttime.toString(format: .isoDateTimeFull)!)
			, .id(id(data.id, "entry"))
		],
		entryCallout(data)
		, entryHeading(data)
		, entryBody(data)
		, entryCaption(data)
	)
}

func entryCallout(_ data: Entry) -> Node {
	.div(
		attributes: [
			.class("callout")
			, .id(id(data.id, "callout"))
		],
		.text(data.callout)
	)
}

func entryHeading(_ data: Entry) -> Node {
	.div(
		attributes: [
			.class("heading")
			, .id(id(data.id, "heading"))
		],
		.text(data.title)
	)
}

func entryBody(_ data: Entry) -> Node {
	.div(
	entryAbstract(data)
	, entryExpandButton(data)
	, entrySession(data)
	)
}

func entryAbstract(_ data: Entry) -> Node {
//	print(data.abstract, "\n-------------\n")
	if let abstract = data.abstract {
		return .div(
			attributes: [
				.class("abstract")
				, .id(id(data.id, "abstract"))
				, .onclick(unsafe: "toggleAbstract('\(id(data.id, "entry"))', '\(id(data.id, "abstract"))', '\(id(data.id, "expand"))', '\(id(data.id, "collapse"))')")
			],
			.text(abstract)
		)
	} else {
		return .text("")
	}
}

func entrySession(_ data: Entry) -> Node {
	if let title = data.session.title {
		return .div(
			attributes: [
				.class("session")
				, .id(id(data.id, "session"))
			],
			.text(title)
		)
	} else {
		return .text("")
	}
}

func entryExpandButton(_ data: Entry) -> Node {
	if data.abstract != nil {
		return .div(
			attributes: [.style(safe: "display: inline;")],
			.div(
				attributes: [
					.class("expand button highlightUnderline highlightColor")
					, .id(id(data.id, "expand"))
					, .onclick(unsafe: "toggleAbstract('\(id(data.id, "entry"))', '\(id(data.id, "abstract"))', '\(id(data.id, "expand"))', '\(id(data.id, "collapse"))')")
				],
				"mehr"
			),
			.div(
				attributes: [
					.class("collapse button highlightUnderline highlightColor")
					, .id(id(data.id, "collapse"))
					, .onclick(unsafe: "toggleAbstract('\(id(data.id, "entry"))', '\(id(data.id, "abstract"))', '\(id(data.id, "expand"))', '\(id(data.id, "collapse"))')")
				],
				"weniger"
			)
		)
	}
	else {
		return .text("")
	}
}

func entryCaption(_ data: Entry) -> Node {
	if let caption = data.caption {
		if data.biography?.isEmpty ?? true
				|| data.biography == "[Bio folgt]"
				|| data.biography == "[Moderator Diskussion]" {
			return .div(
				attributes: [
					.class("caption")
					, .id(id(data.id, "caption"))
					, .style(unsafe: "color: \(data.color);")
					, .title(data.type ?? "")
				],
				.text(caption)
			)
		} else {
			return .div(
			.div(
				attributes: [
					.class("caption button highlightUnderline")
					, .id(id(data.id, "caption"))
					, .style(unsafe: "color: \(data.color);")
					, .title(data.type ?? "")
					, .onclick(unsafe: "showBiography('\(id(data.id, "dialog"))', '\(id(data.id, "biography"))')")
				],
				.text(caption + " ↗️")
			)
			, entryCaptionDialog(data)
			)
		}
	} else {
		return .text("")
	}
}

func entryCaptionDialog(_ data: Entry) -> Node {
	.div(
		.element(
			"dialog",
			attributes: [Attribute<Tag.Html>]() + [
				.id(id(data.id, "dialog"))
				, .class("dialog")
				, .style(unsafe: "border-color: \(data.color);")
			],
			.div(
				attributes: [
					.id(id(data.id, "biography"))
					, .class("biography")
				],
				.text(data.biography!)
			)
		)
	)
}

// MARK: Helper

func id(_ id: Int, _ value: String) -> String {
	return "\(id)_\(value)"
}
