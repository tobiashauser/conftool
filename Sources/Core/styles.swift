import Css
import Prelude

public func styles() -> String {
	render(
		config:.pretty,
		css: htmlStyle
		<> bodyStyle
		<> fixLineHeightSuperSubscript
		<> pStyle
		<> aStyle
		<> buttonStyle
		<> highlightColorStyle
		<> hightlightUnderlineStyle
		<> dialogBackdropStyle
		<> resetFocusStyle
		<> headerStyle
		<> headerScrollbarStyle
		<> headerPushStyle
		<> headerItemStyle
		<> hrStyle
		<> entryStyle
		<> calloutAddToCalendarBoxStyle
		<> addToCalendarStyle
		<> calloutStyle
		<> headingStyle
		<> abstractStyle
		<> abstractInformationStyle
		<> sessionStyle
		<> expandStyle
		<> collapseStyle
		<> captionStyle
		<> spacingStyle
		<> dialogStyle
		<> biographyStyle
		<> pastEventStyle
		<> noScrollStyle
	)
}

let push = CssSelector(stringLiteral: ".push")

let button = CssSelector(stringLiteral: ".button")
let buttonHover = CssSelector(".button:hover")
let highlightColor = CssSelector(".highlightColor")
let highlightColorHover = CssSelector(".highlightColor:hover")
let highlightUnderline = CssSelector(".highlightUnderline")
let highlightUnderlineHover = CssSelector(".highlightUnderline:hover")
let dialogBackdrop = CssSelector("dialog::backdrop")

let header = CssSelector(stringLiteral: ".header")
let headerItem = CssSelector(stringLiteral: ".headerItem")
let entry = CssSelector(".entry")
let calloutAddToCalendarBox = CssSelector(".calloutAddToCalendarBox")
let addToCalendar = CssSelector(".addToCalendar")
let callout = CssSelector(".callout")
let heading = CssSelector(".heading")
let abstract = CssSelector(".abstract")
let session = CssSelector(".session")
let expand = CssSelector(".expand")
let collapse = CssSelector(".collapse")
let caption = CssSelector(".caption")
let dialog = CssSelector("dialog")
let biography = CssSelector(".biography")
let pastEvent = CssSelector(".pastEvent")
let noScroll = CssSelector(".noScroll")

// MARK: Tags

let htmlStyle = html % (
	fontFamily(["-apple-system", "Helvetica Neue", "Helvetica", "Arial", "sans-serif"])
	<> fontSize(.px(14))
	<> lineHeight(.rem(1.25))
)

let bodyStyle = body % (
	display(.block)
	<> margin(top: .px(0), right: .px(8), bottom: .px(8), left: .px(8))
	<> padding(top: .rem(0), right: .rem(2), bottom: .rem(2), left: .rem(2))
)

// Remove extra line height for sub and sup
let fixLineHeightSuperSubscript = (sup | sub) % (
	top(.em(-0.4))
	<> verticalAlign(.baseline)
	<> position(.relative)
	<> key("z-index", "-1")
)
<> sub % ( top(.em(0.4)) )

// Remove spacing from p
let pStyle = p % (
//	margin(topBottom: .rem(0.5))
	margin(all: 0)
)

let aStyle = a % (
	color(.gray)
	<> key("text-decoration", "none")
)

// MARK: Blocks

let buttonStyle = buttonHover % (
	key("cursor", "pointer")
)

let highlightColorStyle = highlightColorHover % (
	color(.black)
)

let hightlightUnderlineStyle = highlightUnderlineHover % (
	key("text-decoration", "underline")
)

let dialogBackdropStyle = dialogBackdrop % (
	position(.fixed)
	<> backgroundColor(.rgba(0, 0, 0, 0.4))
)

let resetFocusStyle = CssSelector("*:focus") % (
	outline(style: Stroke.none)
)

// MARK: Classes

let headerStyle = header % (
	display(.flex)
	<> key("-webkit-flex", "flex")
	<> flex(direction: .row)
	<> key("-webkit-flex-direction", "row")
	<> overflow(.scroll)
	<> key("column-gap", "0.2em")
	<> fontWeight(.w700)
	<> padding(topBottom: .rem(2))
	<> position(.sticky)
	<> top(0)
	<> backgroundColor(.white)
//	<> key("-ms-overflow-style", "none")
//	<> key("scrollbar-width", "none")
)
let headerScrollbarStyle = CssSelector(".header::-webkit-scrollbar") % ( display(.none) )

let headerItemStyle = headerItem % (
	key("white-space", "nowrap")
)

let headerPushStyle = (header ** push) % (
	margin(left: .auto)
)

let hrStyle = hr % (
	margin(topBottom: .rem(2))
)

let entryStyle = entry % (
	key("scroll-margin", "5rem")
//	.empty
)

let calloutAddToCalendarBoxStyle = calloutAddToCalendarBox % (
	display(.flex)
	<> flex(wrap: .wrap)
	<> justify(content: .spaceBetween)
)

let addToCalendarStyle = addToCalendar % (
	color(.gray)
	<> fontSize(.rem(0.85))
//	<> margin(left: .auto)
)

let calloutStyle = callout % (
	fontWeight(.w700)
	<> fontSize(.rem(0.75))
	<> textTransform(.uppercase)
	<> letterSpacing(.pt(0.54))
)

let headingStyle = heading % (
	fontSize(.rem(1.25))
	<> fontWeight(.w700)
	<> lineHeight(.rem(1.45))
	<> margin(top: .rem(1), bottom: .rem(0.5))
)

let abstractStyle = abstract % (
	fontSize(.rem(1))
	<> lineHeight(.rem(1.35))
//	<> height(.rem(1.35 * 5 - 0.2))
	<> key("max-height", "6.55rem")
	<> overflow(.hidden)
)

let abstractInformationStyle = (session | expand | collapse) % (
	color(.gray)
	<> fontSize(.rem(0.85))
	<> padding(top: .rem(0.5))
)

let sessionStyle = session % (
	float(.right)
	<> key("text-align", "right")
)

let expandStyle = expand % (
	display(.inlineBlock)
)

let collapseStyle = collapse % (
	display(.none)
)

let captionStyle = caption % (
	fontSize(.rem(0.85))
	<> fontWeight(.w500)
	<> letterSpacing(.pt(0.3))
	<> display(.inlineBlock)
)

let spacingStyle = (heading | caption) % (
	margin(top: .rem(1))
)

let dialogStyle = dialog % (
	borderRadius(all: .rem(0.5))
	<> maxWidth(.otherSize("75vw"))
	<> maxHeight(.otherSize("80vh"))
	<> key("box-shadow", "0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)")
//	<> key("touch-action", "none")
	<> key("overscroll-behavior", "none")
)

let biographyStyle = biography % (
	fontSize(.rem(0.85))
	<> fontWeight(.w500)
	<> letterSpacing(.pt(0.3))
)

let pastEventStyle = pastEvent % (
	key("color", "gray!important")
)

let noScrollStyle = noScroll % (
	overflow(.hidden)
)
