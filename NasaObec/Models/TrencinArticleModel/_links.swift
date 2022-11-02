/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct _links : Codable {
	let self : [Self]?
	let collection : [Collection]?
	let about : [About]?
	let author : [Author]?
	let replies : [Replies]?
	let version-history : [Version-history]?
	let predecessor-version : [Predecessor-version]?
	let wp:featuredmedia : [Wp:featuredmedia]?
	let wp:attachment : [Wp:attachment]?
	let wp:term : [Wp:term]?
	let curies : [Curies]?

	enum CodingKeys: String, CodingKey {

		case self = "self"
		case collection = "collection"
		case about = "about"
		case author = "author"
		case replies = "replies"
		case version-history = "version-history"
		case predecessor-version = "predecessor-version"
		case wp:featuredmedia = "wp:featuredmedia"
		case wp:attachment = "wp:attachment"
		case wp:term = "wp:term"
		case curies = "curies"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self = try values.decodeIfPresent([Self].self, forKey: .self)
		collection = try values.decodeIfPresent([Collection].self, forKey: .collection)
		about = try values.decodeIfPresent([About].self, forKey: .about)
		author = try values.decodeIfPresent([Author].self, forKey: .author)
		replies = try values.decodeIfPresent([Replies].self, forKey: .replies)
		version-history = try values.decodeIfPresent([Version-history].self, forKey: .version-history)
		predecessor-version = try values.decodeIfPresent([Predecessor-version].self, forKey: .predecessor-version)
		wp:featuredmedia = try values.decodeIfPresent([Wp:featuredmedia].self, forKey: .wp:featuredmedia)
		wp:attachment = try values.decodeIfPresent([Wp:attachment].self, forKey: .wp:attachment)
		wp:term = try values.decodeIfPresent([Wp:term].self, forKey: .wp:term)
		curies = try values.decodeIfPresent([Curies].self, forKey: .curies)
	}

}