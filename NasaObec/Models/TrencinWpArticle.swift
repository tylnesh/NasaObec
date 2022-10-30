//
//  TrencinWpArticle.swift
//  NasaObec
//
//  Created by Michal Kohútek on 24/10/2022.
//

import Foundation
import SwiftUI



struct TrencinWpArticle: Codable, Identifiable {
    var id: Int
    var dateGmt: String
    var modifiedGmt: String
    var link: String
    var title: Title
    var excerpt: Excerpt
    var content: Content
    var mediaLink: Yoast
    
    var evenCount: Bool {
        return id % 2 != 0
    }
    
    var mainColor: Color {
        if (evenCount) {
            return .black
        } else {
            return .white
        }
    }
    
    var accentColor: Color {
        if (evenCount) {
            return .white
        } else {
            return .black
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case dateGmt = "date_gmt"
        case modifiedGmt = "modified_gmt"
        case link
        case title
        case excerpt
        case content
        case mediaLink = "yoast_head_json"
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
        mediaLink = try values.decode(Yoast.self, forKey: .mediaLink)
    }
    
    init(id:Int = 0, dateGmt:String = "", modifiedGmt:String = "", link:String = "", title:Title = Title(rendered:""), excerpt:Excerpt = Excerpt(rendered: ""), content:Content = Content(rendered: ""), mediaLink:Yoast = Yoast(ogImage: OgImage(urlString:"",width:100,height:100,type: ""))) {
        self.id = id
        self.dateGmt = dateGmt
        self.modifiedGmt = modifiedGmt
        self.link = link
        self.title = title
        self.excerpt = excerpt
        self.content = content
        self.mediaLink = mediaLink
    }
    
    mutating func replace(newArticle: TrencinWpArticle) {
        self.id = newArticle.id
        self.dateGmt = newArticle.dateGmt
        self.modifiedGmt = newArticle.dateGmt
        self.link = newArticle.link
        self.title = newArticle.title
        self.excerpt = newArticle.excerpt
        self.content = newArticle.content
        self.mediaLink = newArticle.mediaLink
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
            self.protected = false
        }
    }
    
    struct Content: Codable {
        var rendered: String = "some content"
        var protected: Bool = false
        
        init(rendered: String) {
            self.rendered = rendered
        }
    }
    
    struct Yoast: Codable {
        var ogImages: [OgImage] = []
        
        init(ogImage: OgImage) {
            self.ogImages.append(TrencinWpArticle.OgImage(urlString: "someUrl", width: 100, height: 100, type: "someType"))
        }
        
        enum CodingKeys: String, CodingKey {
            case ogImages = "og_image"
        }
        
    
    }
    
 
        
        struct OgImage: Codable {
            var url:String = "Some image URL"
            var width:Int = 150
            var height:Int = 150
            var type:String = "sometype"
            
            enum CodingKeys: String, CodingKey {
                case url
                case width
                case height
                case type
                
            }

            init(urlString:String, width:Int, height:Int, type:String) {
                self.url = urlString
                self.width = width
                self.height = height
                self.type = type
            }
            
        }
    
}

extension TrencinWpArticle {
    static let sampleString:String = #"""
[
  {
    "id": 70758,
    "date": "2022-10-28T15:13:20",
    "date_gmt": "2022-10-28T13:13:20",
    "guid": {
      "rendered": "https://trencin.sk/?p=70758"
    },
    "modified": "2022-10-28T15:13:20",
    "modified_gmt": "2022-10-28T13:13:20",
    "slug": "stanislav-rehak",
    "status": "publish",
    "type": "post",
    "link": "https://trencin.sk/smutocne-oznamy/stanislav-rehak/",
    "title": {
      "rendered": "Stanislav Rehák"
    },
    "content": {
      "rendered": "<p>S hlbokým žiaľom oznamujeme všetkým príbuzným, priateľom a známym, že</p>\n<p><H2> Stanislav Rehák </H2></p>\n<p>nás opustil(a) dňa: 28.10.2022, vo veku 82 rokov.</p>\n<p>Posledná rozlúčka sa uskutoční dňa: 02.11.2022.</p>\n<p>&nbsp;</p>\n<p><img width=\"640\" height=\"905\" src=\"https://trencin.sk/wp-content/uploads/2022/10/8048.jpg\" class=\"size-large alignnone wp-image-70759\" alt=\"\" loading=\"lazy\" srcset=\"https://trencin.sk/wp-content/uploads/2022/10/8048.jpg 800w, https://trencin.sk/wp-content/uploads/2022/10/8048-495x700.jpg 495w, https://trencin.sk/wp-content/uploads/2022/10/8048-283x400.jpg 283w, https://trencin.sk/wp-content/uploads/2022/10/8048-768x1086.jpg 768w, https://trencin.sk/wp-content/uploads/2022/10/8048-17x24.jpg 17w, https://trencin.sk/wp-content/uploads/2022/10/8048-25x36.jpg 25w, https://trencin.sk/wp-content/uploads/2022/10/8048-34x48.jpg 34w\" sizes=\"(max-width: 640px) 100vw, 640px\" /></p>\n",
      "protected": false
    },
    "excerpt": {
      "rendered": "<p>S hlbokým žiaľom oznamujeme všetkým príbuzným, priateľom a známym, že Stanislav Rehák nás opustil(a) dňa: 28.10.2022, vo veku 82 rokov. Posledná rozlúčka sa uskutoční dňa: 02.11.2022. &nbsp; [&#8230;]</p>\n<p><a class=\"btn btn-secondary understrap-read-more-link\" href=\"https://trencin.sk/smutocne-oznamy/stanislav-rehak/\">Čítať viac&#8230;</a></p>\n",
      "protected": false
    },
    "author": 6,
    "featured_media": 70759,
    "comment_status": "closed",
    "ping_status": "closed",
    "sticky": false,
    "template": "",
    "format": "standard",
    "meta": {
      "inline_featured_image": false
    },
    "categories": [
      219
    ],
    "tags": [],
    "yoast_head": "<!-- This site is optimized with the Yoast SEO plugin v18.5.1 - https://yoast.com/wordpress/plugins/seo/ -->\n<title>Stanislav Rehák &raquo; Mesto Trenčín</title>\n<meta name=\"robots\" content=\"index, follow, max-snippet:-1, max-image-preview:large, max-video-preview:-1\" />\n<link rel=\"canonical\" href=\"https://trencin.sk/smutocne-oznamy/stanislav-rehak/\" />\n<meta property=\"og:locale\" content=\"sk_SK\" />\n<meta property=\"og:type\" content=\"article\" />\n<meta property=\"og:title\" content=\"Stanislav Rehák &raquo; Mesto Trenčín\" />\n<meta property=\"og:description\" content=\"S hlbokým žiaľom oznamujeme všetkým príbuzným, priateľom a známym, že Stanislav Rehák nás opustil(a) dňa: 28.10.2022, vo veku 82 rokov. Posledná rozlúčka sa uskutoční dňa: 02.11.2022. &nbsp; [...]Čítať viac...\" />\n<meta property=\"og:url\" content=\"https://trencin.sk/smutocne-oznamy/stanislav-rehak/\" />\n<meta property=\"og:site_name\" content=\"Mesto Trenčín\" />\n<meta property=\"article:publisher\" content=\"https://www.facebook.com/mesto.trencin\" />\n<meta property=\"article:published_time\" content=\"2022-10-28T13:13:20+00:00\" />\n<meta property=\"og:image\" content=\"https://trencin.sk/wp-content/uploads/2022/10/8048.jpg\" />\n\t<meta property=\"og:image:width\" content=\"800\" />\n\t<meta property=\"og:image:height\" content=\"1131\" />\n\t<meta property=\"og:image:type\" content=\"image/jpeg\" />\n<meta name=\"twitter:card\" content=\"summary_large_image\" />\n<meta name=\"twitter:creator\" content=\"@mestotrencin\" />\n<meta name=\"twitter:site\" content=\"@mestotrencin\" />\n<meta name=\"twitter:label1\" content=\"Written by\" />\n\t<meta name=\"twitter:data1\" content=\"Radoslav Jánoš\" />\n<script type=\"application/ld+json\" class=\"yoast-schema-graph\">{\"@context\":\"https://schema.org\",\"@graph\":[{\"@type\":\"Organization\",\"@id\":\"https://trencin.sk/#organization\",\"name\":\"Mesto Trenčín\",\"url\":\"https://trencin.sk/\",\"sameAs\":[\"https://www.facebook.com/mesto.trencin\",\"https://www.instagram.com/mesto.trencin/\",\"https://www.youtube.com/channel/UC-pVfA2BZYFwauL5_ttS8RQ/featured\",\"https://twitter.com/mestotrencin\"],\"logo\":{\"@type\":\"ImageObject\",\"@id\":\"https://trencin.sk/#logo\",\"inLanguage\":\"sk-SK\",\"url\":\"https://trencin.sk/wp-content/uploads/2018/10/2-logo-mesta-stred-cmyk-cervenobiele-ikona.png\",\"contentUrl\":\"https://trencin.sk/wp-content/uploads/2018/10/2-logo-mesta-stred-cmyk-cervenobiele-ikona.png\",\"width\":100,\"height\":66,\"caption\":\"Mesto Trenčín\"},\"image\":{\"@id\":\"https://trencin.sk/#logo\"}},{\"@type\":\"WebSite\",\"@id\":\"https://trencin.sk/#website\",\"url\":\"https://trencin.sk/\",\"name\":\"Mesto Trenčín\",\"description\":\"Trenčianska samospráva\",\"publisher\":{\"@id\":\"https://trencin.sk/#organization\"},\"potentialAction\":[{\"@type\":\"SearchAction\",\"target\":{\"@type\":\"EntryPoint\",\"urlTemplate\":\"https://trencin.sk/?s={search_term_string}\"},\"query-input\":\"required name=search_term_string\"}],\"inLanguage\":\"sk-SK\"},{\"@type\":\"ImageObject\",\"@id\":\"https://trencin.sk/smutocne-oznamy/stanislav-rehak/#primaryimage\",\"inLanguage\":\"sk-SK\",\"url\":\"https://trencin.sk/wp-content/uploads/2022/10/8048.jpg\",\"contentUrl\":\"https://trencin.sk/wp-content/uploads/2022/10/8048.jpg\",\"width\":800,\"height\":1131},{\"@type\":\"WebPage\",\"@id\":\"https://trencin.sk/smutocne-oznamy/stanislav-rehak/#webpage\",\"url\":\"https://trencin.sk/smutocne-oznamy/stanislav-rehak/\",\"name\":\"Stanislav Rehák &raquo; Mesto Trenčín\",\"isPartOf\":{\"@id\":\"https://trencin.sk/#website\"},\"primaryImageOfPage\":{\"@id\":\"https://trencin.sk/smutocne-oznamy/stanislav-rehak/#primaryimage\"},\"datePublished\":\"2022-10-28T13:13:20+00:00\",\"dateModified\":\"2022-10-28T13:13:20+00:00\",\"breadcrumb\":{\"@id\":\"https://trencin.sk/smutocne-oznamy/stanislav-rehak/#breadcrumb\"},\"inLanguage\":\"sk-SK\",\"potentialAction\":[{\"@type\":\"ReadAction\",\"target\":[\"https://trencin.sk/smutocne-oznamy/stanislav-rehak/\"]}]},{\"@type\":\"BreadcrumbList\",\"@id\":\"https://trencin.sk/smutocne-oznamy/stanislav-rehak/#breadcrumb\",\"itemListElement\":[{\"@type\":\"ListItem\",\"position\":1,\"name\":\"Domov\",\"item\":\"https://trencin.sk/\"},{\"@type\":\"ListItem\",\"position\":2,\"name\":\"Stanislav Rehák\"}]},{\"@type\":\"Article\",\"@id\":\"https://trencin.sk/smutocne-oznamy/stanislav-rehak/#article\",\"isPartOf\":{\"@id\":\"https://trencin.sk/smutocne-oznamy/stanislav-rehak/#webpage\"},\"author\":{\"@id\":\"https://trencin.sk/#/schema/person/964f8b8755d45c0622f2aa7ddc0f43ba\"},\"headline\":\"Stanislav Rehák\",\"datePublished\":\"2022-10-28T13:13:20+00:00\",\"dateModified\":\"2022-10-28T13:13:20+00:00\",\"mainEntityOfPage\":{\"@id\":\"https://trencin.sk/smutocne-oznamy/stanislav-rehak/#webpage\"},\"wordCount\":42,\"publisher\":{\"@id\":\"https://trencin.sk/#organization\"},\"image\":{\"@id\":\"https://trencin.sk/smutocne-oznamy/stanislav-rehak/#primaryimage\"},\"thumbnailUrl\":\"https://trencin.sk/wp-content/uploads/2022/10/8048.jpg\",\"articleSection\":[\"Smútočné oznamy\"],\"inLanguage\":\"sk-SK\"},{\"@type\":\"Person\",\"@id\":\"https://trencin.sk/#/schema/person/964f8b8755d45c0622f2aa7ddc0f43ba\",\"name\":\"Radoslav Jánoš\",\"image\":{\"@type\":\"ImageObject\",\"@id\":\"https://trencin.sk/#personlogo\",\"inLanguage\":\"sk-SK\",\"url\":\"https://secure.gravatar.com/avatar/56894725c4fd74916cd552294ad60ac4?s=96&d=mm&r=g\",\"contentUrl\":\"https://secure.gravatar.com/avatar/56894725c4fd74916cd552294ad60ac4?s=96&d=mm&r=g\",\"caption\":\"Radoslav Jánoš\"},\"url\":\"https://trencin.sk/author/radoslav-janos/\"}]}</script>\n<!-- / Yoast SEO plugin. -->",
    "yoast_head_json": {
      "title": "Stanislav Rehák &raquo; Mesto Trenčín",
      "robots": {
        "index": "index",
        "follow": "follow",
        "max-snippet": "max-snippet:-1",
        "max-image-preview": "max-image-preview:large",
        "max-video-preview": "max-video-preview:-1"
      },
      "canonical": "https://trencin.sk/smutocne-oznamy/stanislav-rehak/",
      "og_locale": "sk_SK",
      "og_type": "article",
      "og_title": "Stanislav Rehák &raquo; Mesto Trenčín",
      "og_description": "S hlbokým žiaľom oznamujeme všetkým príbuzným, priateľom a známym, že Stanislav Rehák nás opustil(a) dňa: 28.10.2022, vo veku 82 rokov. Posledná rozlúčka sa uskutoční dňa: 02.11.2022. &nbsp; [...]Čítať viac...",
      "og_url": "https://trencin.sk/smutocne-oznamy/stanislav-rehak/",
      "og_site_name": "Mesto Trenčín",
      "article_publisher": "https://www.facebook.com/mesto.trencin",
      "article_published_time": "2022-10-28T13:13:20+00:00",
      "og_image": [
        {
          "width": 800,
          "height": 1131,
          "url": "https://trencin.sk/wp-content/uploads/2022/10/8048.jpg",
          "type": "image/jpeg"
        }
      ],
      "twitter_card": "summary_large_image",
      "twitter_creator": "@mestotrencin",
      "twitter_site": "@mestotrencin",
      "twitter_misc": {
        "Written by": "Radoslav Jánoš"
      },
      "schema": {
        "@context": "https://schema.org",
        "@graph": [
          {
            "@type": "Organization",
            "@id": "https://trencin.sk/#organization",
            "name": "Mesto Trenčín",
            "url": "https://trencin.sk/",
            "sameAs": [
              "https://www.facebook.com/mesto.trencin",
              "https://www.instagram.com/mesto.trencin/",
              "https://www.youtube.com/channel/UC-pVfA2BZYFwauL5_ttS8RQ/featured",
              "https://twitter.com/mestotrencin"
            ],
            "logo": {
              "@type": "ImageObject",
              "@id": "https://trencin.sk/#logo",
              "inLanguage": "sk-SK",
              "url": "https://trencin.sk/wp-content/uploads/2018/10/2-logo-mesta-stred-cmyk-cervenobiele-ikona.png",
              "contentUrl": "https://trencin.sk/wp-content/uploads/2018/10/2-logo-mesta-stred-cmyk-cervenobiele-ikona.png",
              "width": 100,
              "height": 66,
              "caption": "Mesto Trenčín"
            },
            "image": {
              "@id": "https://trencin.sk/#logo"
            }
          },
          {
            "@type": "WebSite",
            "@id": "https://trencin.sk/#website",
            "url": "https://trencin.sk/",
            "name": "Mesto Trenčín",
            "description": "Trenčianska samospráva",
            "publisher": {
              "@id": "https://trencin.sk/#organization"
            },
            "potentialAction": [
              {
                "@type": "SearchAction",
                "target": {
                  "@type": "EntryPoint",
                  "urlTemplate": "https://trencin.sk/?s={search_term_string}"
                },
                "query-input": "required name=search_term_string"
              }
            ],
            "inLanguage": "sk-SK"
          },
          {
            "@type": "ImageObject",
            "@id": "https://trencin.sk/smutocne-oznamy/stanislav-rehak/#primaryimage",
            "inLanguage": "sk-SK",
            "url": "https://trencin.sk/wp-content/uploads/2022/10/8048.jpg",
            "contentUrl": "https://trencin.sk/wp-content/uploads/2022/10/8048.jpg",
            "width": 800,
            "height": 1131
          },
          {
            "@type": "WebPage",
            "@id": "https://trencin.sk/smutocne-oznamy/stanislav-rehak/#webpage",
            "url": "https://trencin.sk/smutocne-oznamy/stanislav-rehak/",
            "name": "Stanislav Rehák &raquo; Mesto Trenčín",
            "isPartOf": {
              "@id": "https://trencin.sk/#website"
            },
            "primaryImageOfPage": {
              "@id": "https://trencin.sk/smutocne-oznamy/stanislav-rehak/#primaryimage"
            },
            "datePublished": "2022-10-28T13:13:20+00:00",
            "dateModified": "2022-10-28T13:13:20+00:00",
            "breadcrumb": {
              "@id": "https://trencin.sk/smutocne-oznamy/stanislav-rehak/#breadcrumb"
            },
            "inLanguage": "sk-SK",
            "potentialAction": [
              {
                "@type": "ReadAction",
                "target": [
                  "https://trencin.sk/smutocne-oznamy/stanislav-rehak/"
                ]
              }
            ]
          },
          {
            "@type": "BreadcrumbList",
            "@id": "https://trencin.sk/smutocne-oznamy/stanislav-rehak/#breadcrumb",
            "itemListElement": [
              {
                "@type": "ListItem",
                "position": 1,
                "name": "Domov",
                "item": "https://trencin.sk/"
              },
              {
                "@type": "ListItem",
                "position": 2,
                "name": "Stanislav Rehák"
              }
            ]
          },
          {
            "@type": "Article",
            "@id": "https://trencin.sk/smutocne-oznamy/stanislav-rehak/#article",
            "isPartOf": {
              "@id": "https://trencin.sk/smutocne-oznamy/stanislav-rehak/#webpage"
            },
            "author": {
              "@id": "https://trencin.sk/#/schema/person/964f8b8755d45c0622f2aa7ddc0f43ba"
            },
            "headline": "Stanislav Rehák",
            "datePublished": "2022-10-28T13:13:20+00:00",
            "dateModified": "2022-10-28T13:13:20+00:00",
            "mainEntityOfPage": {
              "@id": "https://trencin.sk/smutocne-oznamy/stanislav-rehak/#webpage"
            },
            "wordCount": 42,
            "publisher": {
              "@id": "https://trencin.sk/#organization"
            },
            "image": {
              "@id": "https://trencin.sk/smutocne-oznamy/stanislav-rehak/#primaryimage"
            },
            "thumbnailUrl": "https://trencin.sk/wp-content/uploads/2022/10/8048.jpg",
            "articleSection": [
              "Smútočné oznamy"
            ],
            "inLanguage": "sk-SK"
          },
          {
            "@type": "Person",
            "@id": "https://trencin.sk/#/schema/person/964f8b8755d45c0622f2aa7ddc0f43ba",
            "name": "Radoslav Jánoš",
            "image": {
              "@type": "ImageObject",
              "@id": "https://trencin.sk/#personlogo",
              "inLanguage": "sk-SK",
              "url": "https://secure.gravatar.com/avatar/56894725c4fd74916cd552294ad60ac4?s=96&d=mm&r=g",
              "contentUrl": "https://secure.gravatar.com/avatar/56894725c4fd74916cd552294ad60ac4?s=96&d=mm&r=g",
              "caption": "Radoslav Jánoš"
            },
            "url": "https://trencin.sk/author/radoslav-janos/"
          }
        ]
      }
    },
    "_links": {
      "self": [
        {
          "href": "https://trencin.sk/wp-json/wp/v2/posts/70758"
        }
      ],
      "collection": [
        {
          "href": "https://trencin.sk/wp-json/wp/v2/posts"
        }
      ],
      "about": [
        {
          "href": "https://trencin.sk/wp-json/wp/v2/types/post"
        }
      ],
      "author": [
        {
          "embeddable": true,
          "href": "https://trencin.sk/wp-json/wp/v2/users/6"
        }
      ],
      "replies": [
        {
          "embeddable": true,
          "href": "https://trencin.sk/wp-json/wp/v2/comments?post=70758"
        }
      ],
      "version-history": [
        {
          "count": 1,
          "href": "https://trencin.sk/wp-json/wp/v2/posts/70758/revisions"
        }
      ],
      "predecessor-version": [
        {
          "id": 70760,
          "href": "https://trencin.sk/wp-json/wp/v2/posts/70758/revisions/70760"
        }
      ],
      "wp:featuredmedia": [
        {
          "embeddable": true,
          "href": "https://trencin.sk/wp-json/wp/v2/media/70759"
        }
      ],
      "wp:attachment": [
        {
          "href": "https://trencin.sk/wp-json/wp/v2/media?parent=70758"
        }
      ],
      "wp:term": [
        {
          "taxonomy": "category",
          "embeddable": true,
          "href": "https://trencin.sk/wp-json/wp/v2/categories?post=70758"
        },
        {
          "taxonomy": "post_tag",
          "embeddable": true,
          "href": "https://trencin.sk/wp-json/wp/v2/tags?post=70758"
        }
      ],
      "curies": [
        {
          "name": "wp",
          "href": "https://api.w.org/{rel}",
          "templated": true
        }
      ]
    }
  },
  {
    "id": 70755,
    "date": "2022-10-28T15:12:43",
    "date_gmt": "2022-10-28T13:12:43",
    "guid": {
      "rendered": "https://trencin.sk/?p=70755"
    },
    "modified": "2022-10-28T15:12:43",
    "modified_gmt": "2022-10-28T13:12:43",
    "slug": "jan-horvath",
    "status": "publish",
    "type": "post",
    "link": "https://trencin.sk/smutocne-oznamy/jan-horvath/",
    "title": {
      "rendered": "Ján Horváth"
    },
    "content": {
      "rendered": "<p>S hlbokým žiaľom oznamujeme všetkým príbuzným, priateľom a známym, že</p>\n<p><H2> Ján Horváth </H2></p>\n<p>nás opustil(a) dňa: 28.10.2022, vo veku 95 rokov.</p>\n<p>Posledná rozlúčka sa uskutoční dňa: 03.11.2022.</p>\n<p>&nbsp;</p>\n<p><img width=\"640\" height=\"905\" src=\"https://trencin.sk/wp-content/uploads/2022/10/8047.jpg\" class=\"size-large alignnone wp-image-70756\" alt=\"\" loading=\"lazy\" srcset=\"https://trencin.sk/wp-content/uploads/2022/10/8047.jpg 800w, https://trencin.sk/wp-content/uploads/2022/10/8047-495x700.jpg 495w, https://trencin.sk/wp-content/uploads/2022/10/8047-283x400.jpg 283w, https://trencin.sk/wp-content/uploads/2022/10/8047-768x1086.jpg 768w, https://trencin.sk/wp-content/uploads/2022/10/8047-17x24.jpg 17w, https://trencin.sk/wp-content/uploads/2022/10/8047-25x36.jpg 25w, https://trencin.sk/wp-content/uploads/2022/10/8047-34x48.jpg 34w\" sizes=\"(max-width: 640px) 100vw, 640px\" /></p>\n",
      "protected": false
    },
    "excerpt": {
      "rendered": "<p>S hlbokým žiaľom oznamujeme všetkým príbuzným, priateľom a známym, že Ján Horváth nás opustil(a) dňa: 28.10.2022, vo veku 95 rokov. Posledná rozlúčka sa uskutoční dňa: 03.11.2022. &nbsp; [&#8230;]</p>\n<p><a class=\"btn btn-secondary understrap-read-more-link\" href=\"https://trencin.sk/smutocne-oznamy/jan-horvath/\">Čítať viac&#8230;</a></p>\n",
      "protected": false
    },
    "author": 6,
    "featured_media": 70756,
    "comment_status": "closed",
    "ping_status": "closed",
    "sticky": false,
    "template": "",
    "format": "standard",
    "meta": {
      "inline_featured_image": false
    },
    "categories": [
      219
    ],
    "tags": [],
    "yoast_head": "<!-- This site is optimized with the Yoast SEO plugin v18.5.1 - https://yoast.com/wordpress/plugins/seo/ -->\n<title>Ján Horváth &raquo; Mesto Trenčín</title>\n<meta name=\"robots\" content=\"index, follow, max-snippet:-1, max-image-preview:large, max-video-preview:-1\" />\n<link rel=\"canonical\" href=\"https://trencin.sk/smutocne-oznamy/jan-horvath/\" />\n<meta property=\"og:locale\" content=\"sk_SK\" />\n<meta property=\"og:type\" content=\"article\" />\n<meta property=\"og:title\" content=\"Ján Horváth &raquo; Mesto Trenčín\" />\n<meta property=\"og:description\" content=\"S hlbokým žiaľom oznamujeme všetkým príbuzným, priateľom a známym, že Ján Horváth nás opustil(a) dňa: 28.10.2022, vo veku 95 rokov. Posledná rozlúčka sa uskutoční dňa: 03.11.2022. &nbsp; [...]Čítať viac...\" />\n<meta property=\"og:url\" content=\"https://trencin.sk/smutocne-oznamy/jan-horvath/\" />\n<meta property=\"og:site_name\" content=\"Mesto Trenčín\" />\n<meta property=\"article:publisher\" content=\"https://www.facebook.com/mesto.trencin\" />\n<meta property=\"article:published_time\" content=\"2022-10-28T13:12:43+00:00\" />\n<meta property=\"og:image\" content=\"https://trencin.sk/wp-content/uploads/2022/10/8047.jpg\" />\n\t<meta property=\"og:image:width\" content=\"800\" />\n\t<meta property=\"og:image:height\" content=\"1131\" />\n\t<meta property=\"og:image:type\" content=\"image/jpeg\" />\n<meta name=\"twitter:card\" content=\"summary_large_image\" />\n<meta name=\"twitter:creator\" content=\"@mestotrencin\" />\n<meta name=\"twitter:site\" content=\"@mestotrencin\" />\n<meta name=\"twitter:label1\" content=\"Written by\" />\n\t<meta name=\"twitter:data1\" content=\"Radoslav Jánoš\" />\n<script type=\"application/ld+json\" class=\"yoast-schema-graph\">{\"@context\":\"https://schema.org\",\"@graph\":[{\"@type\":\"Organization\",\"@id\":\"https://trencin.sk/#organization\",\"name\":\"Mesto Trenčín\",\"url\":\"https://trencin.sk/\",\"sameAs\":[\"https://www.facebook.com/mesto.trencin\",\"https://www.instagram.com/mesto.trencin/\",\"https://www.youtube.com/channel/UC-pVfA2BZYFwauL5_ttS8RQ/featured\",\"https://twitter.com/mestotrencin\"],\"logo\":{\"@type\":\"ImageObject\",\"@id\":\"https://trencin.sk/#logo\",\"inLanguage\":\"sk-SK\",\"url\":\"https://trencin.sk/wp-content/uploads/2018/10/2-logo-mesta-stred-cmyk-cervenobiele-ikona.png\",\"contentUrl\":\"https://trencin.sk/wp-content/uploads/2018/10/2-logo-mesta-stred-cmyk-cervenobiele-ikona.png\",\"width\":100,\"height\":66,\"caption\":\"Mesto Trenčín\"},\"image\":{\"@id\":\"https://trencin.sk/#logo\"}},{\"@type\":\"WebSite\",\"@id\":\"https://trencin.sk/#website\",\"url\":\"https://trencin.sk/\",\"name\":\"Mesto Trenčín\",\"description\":\"Trenčianska samospráva\",\"publisher\":{\"@id\":\"https://trencin.sk/#organization\"},\"potentialAction\":[{\"@type\":\"SearchAction\",\"target\":{\"@type\":\"EntryPoint\",\"urlTemplate\":\"https://trencin.sk/?s={search_term_string}\"},\"query-input\":\"required name=search_term_string\"}],\"inLanguage\":\"sk-SK\"},{\"@type\":\"ImageObject\",\"@id\":\"https://trencin.sk/smutocne-oznamy/jan-horvath/#primaryimage\",\"inLanguage\":\"sk-SK\",\"url\":\"https://trencin.sk/wp-content/uploads/2022/10/8047.jpg\",\"contentUrl\":\"https://trencin.sk/wp-content/uploads/2022/10/8047.jpg\",\"width\":800,\"height\":1131},{\"@type\":\"WebPage\",\"@id\":\"https://trencin.sk/smutocne-oznamy/jan-horvath/#webpage\",\"url\":\"https://trencin.sk/smutocne-oznamy/jan-horvath/\",\"name\":\"Ján Horváth &raquo; Mesto Trenčín\",\"isPartOf\":{\"@id\":\"https://trencin.sk/#website\"},\"primaryImageOfPage\":{\"@id\":\"https://trencin.sk/smutocne-oznamy/jan-horvath/#primaryimage\"},\"datePublished\":\"2022-10-28T13:12:43+00:00\",\"dateModified\":\"2022-10-28T13:12:43+00:00\",\"breadcrumb\":{\"@id\":\"https://trencin.sk/smutocne-oznamy/jan-horvath/#breadcrumb\"},\"inLanguage\":\"sk-SK\",\"potentialAction\":[{\"@type\":\"ReadAction\",\"target\":[\"https://trencin.sk/smutocne-oznamy/jan-horvath/\"]}]},{\"@type\":\"BreadcrumbList\",\"@id\":\"https://trencin.sk/smutocne-oznamy/jan-horvath/#breadcrumb\",\"itemListElement\":[{\"@type\":\"ListItem\",\"position\":1,\"name\":\"Domov\",\"item\":\"https://trencin.sk/\"},{\"@type\":\"ListItem\",\"position\":2,\"name\":\"Ján Horváth\"}]},{\"@type\":\"Article\",\"@id\":\"https://trencin.sk/smutocne-oznamy/jan-horvath/#article\",\"isPartOf\":{\"@id\":\"https://trencin.sk/smutocne-oznamy/jan-horvath/#webpage\"},\"author\":{\"@id\":\"https://trencin.sk/#/schema/person/964f8b8755d45c0622f2aa7ddc0f43ba\"},\"headline\":\"Ján Horváth\",\"datePublished\":\"2022-10-28T13:12:43+00:00\",\"dateModified\":\"2022-10-28T13:12:43+00:00\",\"mainEntityOfPage\":{\"@id\":\"https://trencin.sk/smutocne-oznamy/jan-horvath/#webpage\"},\"wordCount\":44,\"publisher\":{\"@id\":\"https://trencin.sk/#organization\"},\"image\":{\"@id\":\"https://trencin.sk/smutocne-oznamy/jan-horvath/#primaryimage\"},\"thumbnailUrl\":\"https://trencin.sk/wp-content/uploads/2022/10/8047.jpg\",\"articleSection\":[\"Smútočné oznamy\"],\"inLanguage\":\"sk-SK\"},{\"@type\":\"Person\",\"@id\":\"https://trencin.sk/#/schema/person/964f8b8755d45c0622f2aa7ddc0f43ba\",\"name\":\"Radoslav Jánoš\",\"image\":{\"@type\":\"ImageObject\",\"@id\":\"https://trencin.sk/#personlogo\",\"inLanguage\":\"sk-SK\",\"url\":\"https://secure.gravatar.com/avatar/56894725c4fd74916cd552294ad60ac4?s=96&d=mm&r=g\",\"contentUrl\":\"https://secure.gravatar.com/avatar/56894725c4fd74916cd552294ad60ac4?s=96&d=mm&r=g\",\"caption\":\"Radoslav Jánoš\"},\"url\":\"https://trencin.sk/author/radoslav-janos/\"}]}</script>\n<!-- / Yoast SEO plugin. -->",
    "yoast_head_json": {
      "title": "Ján Horváth &raquo; Mesto Trenčín",
      "robots": {
        "index": "index",
        "follow": "follow",
        "max-snippet": "max-snippet:-1",
        "max-image-preview": "max-image-preview:large",
        "max-video-preview": "max-video-preview:-1"
      },
      "canonical": "https://trencin.sk/smutocne-oznamy/jan-horvath/",
      "og_locale": "sk_SK",
      "og_type": "article",
      "og_title": "Ján Horváth &raquo; Mesto Trenčín",
      "og_description": "S hlbokým žiaľom oznamujeme všetkým príbuzným, priateľom a známym, že Ján Horváth nás opustil(a) dňa: 28.10.2022, vo veku 95 rokov. Posledná rozlúčka sa uskutoční dňa: 03.11.2022. &nbsp; [...]Čítať viac...",
      "og_url": "https://trencin.sk/smutocne-oznamy/jan-horvath/",
      "og_site_name": "Mesto Trenčín",
      "article_publisher": "https://www.facebook.com/mesto.trencin",
      "article_published_time": "2022-10-28T13:12:43+00:00",
      "og_image": [
        {
          "width": 800,
          "height": 1131,
          "url": "https://trencin.sk/wp-content/uploads/2022/10/8047.jpg",
          "type": "image/jpeg"
        }
      ],
      "twitter_card": "summary_large_image",
      "twitter_creator": "@mestotrencin",
      "twitter_site": "@mestotrencin",
      "twitter_misc": {
        "Written by": "Radoslav Jánoš"
      },
      "schema": {
        "@context": "https://schema.org",
        "@graph": [
          {
            "@type": "Organization",
            "@id": "https://trencin.sk/#organization",
            "name": "Mesto Trenčín",
            "url": "https://trencin.sk/",
            "sameAs": [
              "https://www.facebook.com/mesto.trencin",
              "https://www.instagram.com/mesto.trencin/",
              "https://www.youtube.com/channel/UC-pVfA2BZYFwauL5_ttS8RQ/featured",
              "https://twitter.com/mestotrencin"
            ],
            "logo": {
              "@type": "ImageObject",
              "@id": "https://trencin.sk/#logo",
              "inLanguage": "sk-SK",
              "url": "https://trencin.sk/wp-content/uploads/2018/10/2-logo-mesta-stred-cmyk-cervenobiele-ikona.png",
              "contentUrl": "https://trencin.sk/wp-content/uploads/2018/10/2-logo-mesta-stred-cmyk-cervenobiele-ikona.png",
              "width": 100,
              "height": 66,
              "caption": "Mesto Trenčín"
            },
            "image": {
              "@id": "https://trencin.sk/#logo"
            }
          },
          {
            "@type": "WebSite",
            "@id": "https://trencin.sk/#website",
            "url": "https://trencin.sk/",
            "name": "Mesto Trenčín",
            "description": "Trenčianska samospráva",
            "publisher": {
              "@id": "https://trencin.sk/#organization"
            },
            "potentialAction": [
              {
                "@type": "SearchAction",
                "target": {
                  "@type": "EntryPoint",
                  "urlTemplate": "https://trencin.sk/?s={search_term_string}"
                },
                "query-input": "required name=search_term_string"
              }
            ],
            "inLanguage": "sk-SK"
          },
          {
            "@type": "ImageObject",
            "@id": "https://trencin.sk/smutocne-oznamy/jan-horvath/#primaryimage",
            "inLanguage": "sk-SK",
            "url": "https://trencin.sk/wp-content/uploads/2022/10/8047.jpg",
            "contentUrl": "https://trencin.sk/wp-content/uploads/2022/10/8047.jpg",
            "width": 800,
            "height": 1131
          },
          {
            "@type": "WebPage",
            "@id": "https://trencin.sk/smutocne-oznamy/jan-horvath/#webpage",
            "url": "https://trencin.sk/smutocne-oznamy/jan-horvath/",
            "name": "Ján Horváth &raquo; Mesto Trenčín",
            "isPartOf": {
              "@id": "https://trencin.sk/#website"
            },
            "primaryImageOfPage": {
              "@id": "https://trencin.sk/smutocne-oznamy/jan-horvath/#primaryimage"
            },
            "datePublished": "2022-10-28T13:12:43+00:00",
            "dateModified": "2022-10-28T13:12:43+00:00",
            "breadcrumb": {
              "@id": "https://trencin.sk/smutocne-oznamy/jan-horvath/#breadcrumb"
            },
            "inLanguage": "sk-SK",
            "potentialAction": [
              {
                "@type": "ReadAction",
                "target": [
                  "https://trencin.sk/smutocne-oznamy/jan-horvath/"
                ]
              }
            ]
          },
          {
            "@type": "BreadcrumbList",
            "@id": "https://trencin.sk/smutocne-oznamy/jan-horvath/#breadcrumb",
            "itemListElement": [
              {
                "@type": "ListItem",
                "position": 1,
                "name": "Domov",
                "item": "https://trencin.sk/"
              },
              {
                "@type": "ListItem",
                "position": 2,
                "name": "Ján Horváth"
              }
            ]
          },
          {
            "@type": "Article",
            "@id": "https://trencin.sk/smutocne-oznamy/jan-horvath/#article",
            "isPartOf": {
              "@id": "https://trencin.sk/smutocne-oznamy/jan-horvath/#webpage"
            },
            "author": {
              "@id": "https://trencin.sk/#/schema/person/964f8b8755d45c0622f2aa7ddc0f43ba"
            },
            "headline": "Ján Horváth",
            "datePublished": "2022-10-28T13:12:43+00:00",
            "dateModified": "2022-10-28T13:12:43+00:00",
            "mainEntityOfPage": {
              "@id": "https://trencin.sk/smutocne-oznamy/jan-horvath/#webpage"
            },
            "wordCount": 44,
            "publisher": {
              "@id": "https://trencin.sk/#organization"
            },
            "image": {
              "@id": "https://trencin.sk/smutocne-oznamy/jan-horvath/#primaryimage"
            },
            "thumbnailUrl": "https://trencin.sk/wp-content/uploads/2022/10/8047.jpg",
            "articleSection": [
              "Smútočné oznamy"
            ],
            "inLanguage": "sk-SK"
          },
          {
            "@type": "Person",
            "@id": "https://trencin.sk/#/schema/person/964f8b8755d45c0622f2aa7ddc0f43ba",
            "name": "Radoslav Jánoš",
            "image": {
              "@type": "ImageObject",
              "@id": "https://trencin.sk/#personlogo",
              "inLanguage": "sk-SK",
              "url": "https://secure.gravatar.com/avatar/56894725c4fd74916cd552294ad60ac4?s=96&d=mm&r=g",
              "contentUrl": "https://secure.gravatar.com/avatar/56894725c4fd74916cd552294ad60ac4?s=96&d=mm&r=g",
              "caption": "Radoslav Jánoš"
            },
            "url": "https://trencin.sk/author/radoslav-janos/"
          }
        ]
      }
    },
    "_links": {
      "self": [
        {
          "href": "https://trencin.sk/wp-json/wp/v2/posts/70755"
        }
      ],
      "collection": [
        {
          "href": "https://trencin.sk/wp-json/wp/v2/posts"
        }
      ],
      "about": [
        {
          "href": "https://trencin.sk/wp-json/wp/v2/types/post"
        }
      ],
      "author": [
        {
          "embeddable": true,
          "href": "https://trencin.sk/wp-json/wp/v2/users/6"
        }
      ],
      "replies": [
        {
          "embeddable": true,
          "href": "https://trencin.sk/wp-json/wp/v2/comments?post=70755"
        }
      ],
      "version-history": [
        {
          "count": 1,
          "href": "https://trencin.sk/wp-json/wp/v2/posts/70755/revisions"
        }
      ],
      "predecessor-version": [
        {
          "id": 70757,
          "href": "https://trencin.sk/wp-json/wp/v2/posts/70755/revisions/70757"
        }
      ],
      "wp:featuredmedia": [
        {
          "embeddable": true,
          "href": "https://trencin.sk/wp-json/wp/v2/media/70756"
        }
      ],
      "wp:attachment": [
        {
          "href": "https://trencin.sk/wp-json/wp/v2/media?parent=70755"
        }
      ],
      "wp:term": [
        {
          "taxonomy": "category",
          "embeddable": true,
          "href": "https://trencin.sk/wp-json/wp/v2/categories?post=70755"
        },
        {
          "taxonomy": "post_tag",
          "embeddable": true,
          "href": "https://trencin.sk/wp-json/wp/v2/tags?post=70755"
        }
      ],
      "curies": [
        {
          "name": "wp",
          "href": "https://api.w.org/{rel}",
          "templated": true
        }
      ]
    }
  }]
"""#
    static let sampleData = sampleString.data(using: .utf8)!
    static let sampleArticles = try? JSONDecoder().decode([TrencinWpArticle].self, from: sampleData)
}


