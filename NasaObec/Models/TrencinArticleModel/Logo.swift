/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Logo : Codable {
	let @type : String?
	let @id : String?
	let inLanguage : String?
	let url : String?
	let contentUrl : String?
	let width : Int?
	let height : Int?
	let caption : String?

	enum CodingKeys: String, CodingKey {

		case @type = "@type"
		case @id = "@id"
		case inLanguage = "inLanguage"
		case url = "url"
		case contentUrl = "contentUrl"
		case width = "width"
		case height = "height"
		case caption = "caption"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		@type = try values.decodeIfPresent(String.self, forKey: .@type)
		@id = try values.decodeIfPresent(String.self, forKey: .@id)
		inLanguage = try values.decodeIfPresent(String.self, forKey: .inLanguage)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		contentUrl = try values.decodeIfPresent(String.self, forKey: .contentUrl)
		width = try values.decodeIfPresent(Int.self, forKey: .width)
		height = try values.decodeIfPresent(Int.self, forKey: .height)
		caption = try values.decodeIfPresent(String.self, forKey: .caption)
	}

}