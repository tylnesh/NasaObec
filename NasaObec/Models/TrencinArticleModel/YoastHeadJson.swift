/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct YoastHeadJson : Codable {
	let title : String?
	let robots : Robots?
	let canonical : String?
	let ogLocale : String?
	let ogType : String?
	let ogTitle : String?
	let ogDescription : String?
	let ogUrl : String?
	let ogSiteName : String?
	let articlePublisher : String?
	let articlePublishedTime : String?
	let articleModifiedTime : String?
	let ogImage : [OgImage]?
	let twitterCard : String?
	let twitterCreator : String?
	let twitterSite : String?
	let twitterMisc : TwitterMisc?
	let schema : Schema?

	enum CodingKeys: String, CodingKey {

		case title = "title"
		case robots = "robots"
		case canonical = "canonical"
		case ogLocale = "og_locale"
		case ogType = "og_type"
		case ogTitle = "og_title"
		case ogDescription = "og_description"
		case ogUrl = "og_url"
		case ogSiteName = "og_site_name"
		case articlePublisher = "article_publisher"
		case articlePublishedTime = "article_published_time"
		case articleModifiedTime = "article_modified_time"
		case ogImage = "og_image"
		case twitterCard = "twitter_card"
		case twitterCreator = "twitter_creator"
		case twitterSite = "twitter_site"
		case twitterMisc = "twitter_misc"
		case schema = "schema"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		robots = try values.decodeIfPresent(Robots.self, forKey: .robots)
		canonical = try values.decodeIfPresent(String.self, forKey: .canonical)
		ogLocale = try values.decodeIfPresent(String.self, forKey: .ogLocale)
		ogType = try values.decodeIfPresent(String.self, forKey: .ogType)
		ogTitle = try values.decodeIfPresent(String.self, forKey: .ogTitle)
		ogDescription = try values.decodeIfPresent(String.self, forKey: .ogDescription)
		ogUrl = try values.decodeIfPresent(String.self, forKey: .ogUrl)
		ogSiteName = try values.decodeIfPresent(String.self, forKey: .ogSiteName)
		articlePublisher = try values.decodeIfPresent(String.self, forKey: .articlePublisher)
		articlePublishedTime = try values.decodeIfPresent(String.self, forKey: .articlePublishedTime)
		articleModifiedTime = try values.decodeIfPresent(String.self, forKey: .articleModifiedTime)
		ogImage = try values.decodeIfPresent([OgImage].self, forKey: .ogImage)
		twitterCard = try values.decodeIfPresent(String.self, forKey: .twitterCard)
		twitterCreator = try values.decodeIfPresent(String.self, forKey: .twitterCreator)
		twitterSite = try values.decodeIfPresent(String.self, forKey: .twitterSite)
		twitterMisc = try values.decodeIfPresent(TwitterMisc.self, forKey: .twitterMisc)
		schema = try values.decodeIfPresent(Schema.self, forKey: .schema)
	}

}
