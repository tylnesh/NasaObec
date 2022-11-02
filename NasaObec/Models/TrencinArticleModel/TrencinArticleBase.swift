/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct TrencinArticleBase : Codable, Identifiable {
	let id : Int?
	let date : String?
	let dateGmt : String?
	let guid : Guid?
	let modified : String?
	let modifiedGmt : String?
	let slug : String?
	let status : String?
	let type : String?
	let link : String?
	let title : Title?
	let content : Content?
	let excerpt : Excerpt?
	let author : Int?
	let featuredMedia : Int?
	let commentStatus : String?
	let pingStatus : String?
	let sticky : Bool?
	let template : String?
	let format : String?
	let meta : Meta?
	let categories : [Int]?
	let tags : [String]?
	let yoastHead : String?
	let yoastHeadJson : YoastHeadJson?
	let links : Links?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case date = "date"
		case dateGmt = "date_gmt"
		case guid = "guid"
		case modified = "modified"
		case modifiedGmt = "modified_gmt"
		case slug = "slug"
		case status = "status"
		case type = "type"
		case link = "link"
		case title = "title"
		case content = "content"
		case excerpt = "excerpt"
		case author = "author"
		case featuredMedia = "featured_media"
		case commentStatus = "comment_status"
		case pingStatus = "ping_status"
		case sticky = "sticky"
		case template = "template"
		case format = "format"
		case meta = "meta"
		case categories = "categories"
		case tags = "tags"
		case yoastHead = "yoast_head"
		case yoastHeadJson = "yoast_head_json"
		case links = "_links"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		date = try values.decodeIfPresent(String.self, forKey: .date)
		dateGmt = try values.decodeIfPresent(String.self, forKey: .dateGmt)
		guid = try values.decodeIfPresent(Guid.self, forKey: .guid)
		modified = try values.decodeIfPresent(String.self, forKey: .modified)
		modifiedGmt = try values.decodeIfPresent(String.self, forKey: .modifiedGmt)
		slug = try values.decodeIfPresent(String.self, forKey: .slug)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		link = try values.decodeIfPresent(String.self, forKey: .link)
		title = try values.decodeIfPresent(Title.self, forKey: .title)
		content = try values.decodeIfPresent(Content.self, forKey: .content)
		excerpt = try values.decodeIfPresent(Excerpt.self, forKey: .excerpt)
		author = try values.decodeIfPresent(Int.self, forKey: .author)
		featuredMedia = try values.decodeIfPresent(Int.self, forKey: .featuredMedia)
		commentStatus = try values.decodeIfPresent(String.self, forKey: .commentStatus)
		pingStatus = try values.decodeIfPresent(String.self, forKey: .pingStatus)
		sticky = try values.decodeIfPresent(Bool.self, forKey: .sticky)
		template = try values.decodeIfPresent(String.self, forKey: .template)
		format = try values.decodeIfPresent(String.self, forKey: .format)
		meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
		categories = try values.decodeIfPresent([Int].self, forKey: .categories)
		tags = try values.decodeIfPresent([String].self, forKey: .tags)
		yoastHead = try values.decodeIfPresent(String.self, forKey: .yoastHead)
		yoastHeadJson = try values.decodeIfPresent(YoastHeadJson.self, forKey: .yoastHeadJson)
		links = try values.decodeIfPresent(Links.self, forKey: .links)
	}
    
    
//    init(id:Int = 0, dateGmt:String = "", modifiedGmt:String = "", link:String = "", title:Title = Title(rendered:""), excerpt:Excerpt = Excerpt(rendered: ""), content:Content = Content(rendered: ""), mediaLink:Yoast = Yoast(ogImage: OgImage(urlString:"",width:100,height:100,type: ""))) {
//        self.id = id
//        self.dateGmt = dateGmt
//        self.modifiedGmt = modifiedGmt
//        self.link = link
//        self.title = title
//        self.excerpt = excerpt
//        self.content = content
//        self.mediaLink = mediaLink
//    }
    

}

extension TrencinArticleBase {
    var strippedExcerpt:NSAttributedString {
        do {
            let attributedString = try NSAttributedString(data:(self.excerpt?.rendered!.data(using: .utf16))!, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil )
            return attributedString
        } catch {
            print(error)
        }
        return NSAttributedString("")
    }

    var strippedTitle:NSAttributedString {
        do {
            let attributedString = try NSAttributedString(data:(self.title?.rendered!.data(using: .utf16))!, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil )
            return attributedString
        } catch {
            print(error)
        }
        return NSAttributedString("")
    }
    
    var published:Date {
        let RFC3339DateFormatter = DateFormatter()
        RFC3339DateFormatter.locale = Locale(identifier: "en_US_POSIX")
        RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        
        let date = RFC3339DateFormatter.date(from: dateGmt!) ?? Date()
    
        return date
    }
    
    var updated:Date {
        let RFC3339DateFormatter = DateFormatter()
        RFC3339DateFormatter.locale = Locale(identifier: "en_US_POSIX")
        RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        
        let date = RFC3339DateFormatter.date(from: modifiedGmt!) ?? Date()
        return date
    }
    
    
}

