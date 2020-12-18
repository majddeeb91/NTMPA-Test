
import Foundation
struct Media : Codable {
	let type : String?
	let subtype : String?
	let caption : String?
	let copyright : String?
	let approved_for_syndication : Int?
	let media_metadata : [Media_metadata]?

	enum CodingKeys: String, CodingKey {

		case type = "type"
		case subtype = "subtype"
		case caption = "caption"
		case copyright = "copyright"
		case approved_for_syndication = "approved_for_syndication"
		case media_metadata = "media-metadata"
	}

	init(from decoder: Decoder) throws {
		let values = try? decoder.container(keyedBy: CodingKeys.self)
		type = try? values?.decodeIfPresent(String.self, forKey: .type)
		subtype = try? values?.decodeIfPresent(String.self, forKey: .subtype)
		caption = try? values?.decodeIfPresent(String.self, forKey: .caption)
		copyright = try? values?.decodeIfPresent(String.self, forKey: .copyright)
		approved_for_syndication = try? values?.decodeIfPresent(Int.self, forKey: .approved_for_syndication)
		media_metadata = try? values?.decodeIfPresent([Media_metadata].self, forKey: .media_metadata)
	}

}
