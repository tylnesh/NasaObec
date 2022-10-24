//
//  TrencinWpArticle.swift
//  NasaObec
//
//  Created by Michal Kohútek on 24/10/2022.
//

import Foundation

struct TrencinWpArticle: Codable {
    var id: Int
    var dateGmt: String
    var modifiedGmt: String
    var link: String
    var title: Title
    var excerpt: Excerpt
    var content: Content
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case dateGmt = "date_gmt"
        case modifiedGmt = "modified_gmt"
        case link
        case title
        case excerpt
        case content
    }
    
    init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        dateGmt = try values.decode(String.self, forKey: .dateGmt)
        modifiedGmt = try values.decode(String.self, forKey: .modifiedGmt)
        link = try values.decode(String.self, forKey: .link)
        title = try values.decode(Title.self, forKey: .title)
        excerpt = try values.decode(Excerpt.self, forKey: .excerpt)
        content = try values.decode(Content.self, forKey: .content)
    }

    
    
    struct Title: Codable {
        var rendered: String = "some title"

        init(rendered: String) {
            self.rendered = rendered
        }
    }

    struct Excerpt: Codable {
        var rendered: String = "some excerpt"
        var protected: Bool = false

        init(rendered: String) {
            self.rendered = rendered
        }
    }

    struct Content: Codable {
        var rendered: String = "some content"
        var protected: Bool = false

        init(rendered: String) {
            self.rendered = rendered
        }
    }
        
}



