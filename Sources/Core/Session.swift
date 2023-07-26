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
		self.title = title != "" ? title : nil
		self.room = room
	}
}
