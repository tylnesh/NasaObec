/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct OgImage : Codable {
	let width : String?
	let height : String?
	let url : String?
	let type : String?

	enum CodingKeys: String, CodingKey {

		case width = "width"
		case height = "height"
		case url = "url"
		case type = "type"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		width = try values.decodeIfPresent(String.self, forKey: .width)
		height = try values.decodeIfPresent(String.self, forKey: .height)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		type = try values.decodeIfPresent(String.self, forKey: .type)
	}
    
//    init(urlString:String, width:Int, height:Int, type:String) {
//        self.url = urlString
//        self.width = width
//        self.height = height
//        self.type = type
//    }

}

@propertyWrapper
struct StringForcible: Codable {
    
    var wrappedValue: String?
    
    enum CodingKeys: CodingKey {}
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let string = try? container.decode(String.self) {
            wrappedValue = string
        } else if let integer = try? container.decode(Int.self) {
            wrappedValue = "\(integer)"
        } else if let double = try? container.decode(Double.self) {
            wrappedValue = "\(double)"
        } else if container.decodeNil() {
            wrappedValue = nil
        }
        else {
            throw DecodingError.typeMismatch(String.self, .init(codingPath: container.codingPath, debugDescription: "Could not decode incoming value to String. It is not a type of String, Int or Double."))
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(wrappedValue)
    }
    
    init() {
        self.wrappedValue = nil
    }
    
}
