/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Links : Codable {
	let linkSelf : [LinkSelf]?
	let collection : [Collection]?
	let about : [About]?
	let author : [Author]?
	let replies : [Replies]?
	let versionHistory : [VersionHistory]?
	let predecessorVersion : [PredecessorVersion]?
	let wpFeaturedmedia : [WpFeaturedmedia]?
	let wpAttachment : [WpAttachment]?
	let wpTerm : [WpTerm]?
	let curies : [Curies]?

	enum CodingKeys: String, CodingKey {

		case linkSelf = "self"
		case collection = "collection"
		case about = "about"
		case author = "author"
		case replies = "replies"
		case versionHistory = "version-history"
		case predecessorVersion = "predecessor-version"
		case wpFeaturedmedia = "wp:featuredmedia"
		case wpAttachment = "wp:attachment"
		case wpTerm = "wp:term"
		case curies = "curies"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		linkSelf = try values.decodeIfPresent([LinkSelf].self, forKey: .linkSelf)
		collection = try values.decodeIfPresent([Collection].self, forKey: .collection)
		about = try values.decodeIfPresent([About].self, forKey: .about)
		author = try values.decodeIfPresent([Author].self, forKey: .author)
		replies = try values.decodeIfPresent([Replies].self, forKey: .replies)
		versionHistory = try values.decodeIfPresent([VersionHistory].self, forKey: .versionHistory)
		predecessorVersion = try values.decodeIfPresent([PredecessorVersion].self, forKey: .predecessorVersion)
		wpFeaturedmedia = try values.decodeIfPresent([WpFeaturedmedia].self, forKey: .wpFeaturedmedia)
		wpAttachment = try values.decodeIfPresent([WpAttachment].self, forKey: .wpAttachment)
		wpTerm = try values.decodeIfPresent([WpTerm].self, forKey: .wpTerm)
		curies = try values.decodeIfPresent([Curies].self, forKey: .curies)
	}

}
