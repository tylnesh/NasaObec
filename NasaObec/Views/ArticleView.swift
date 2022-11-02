//
//  ContentView.swift
//  NasaObec
//
//  Created by Michal Kohútek on 10/10/2022.
//

import SwiftUI
import RichText

struct ArticleView: View {
    private let trencinWpArticleUrl = URL(string: "https://trencin.sk/wp-json/wp/v2/posts/70600")
    let article: TrencinArticleBase
    
    let myFormat = Date.FormatStyle()
        .day()
        .month()
        .year()
        .hour()
        .minute()
        .second()
        .locale(Locale(identifier: "sk_SK"))
   
    var body: some View {
        NavigationView {
                ScrollView {
                    HStack {
                        VStack{
                            Text("Publikované:")
                            Text("\(article.published.formatted(myFormat))")
                        }
                        Spacer()
                        VStack {
                            Text("Posledná aktualizácia:")
                            Text("\(article.updated.formatted(myFormat))")
                        }
                    }.font(.caption).padding()
//                    AsyncImage(url:  URL(string: article.mediaLink.ogImages.first!.url)) { image in
                    AsyncImage(url:  URL(string: (article.yoastHeadJson?.ogImages?.first!.url)!)) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }.frame(width:300, height:200).multilineTextAlignment(.center)
                    RichText(html:(article.content?.rendered!)! ).foregroundColor(light: Color.black, dark: Color.white)

//                    RichText(html:article.content.rendered ).foregroundColor(light: Color.black, dark: Color.white)
                }
            
            
        }
        .toolbar {
            ToolbarItem(placement: .principal, content: {
                Text(article.strippedTitle.string)
                    .font(.title2)
            })
            
        }
        
        }
    }


struct MunicipalityView_Previews: PreviewProvider {
//    static var article =  TrencinWpArticle(id: 0, dateGmt: "", modifiedGmt: "", title: TrencinWpArticle.Title(rendered: "Testing Title"),  content: TrencinWpArticle.Content(rendered: "Lorem ipsum dolor blablabla"), mediaLink: TrencinWpArticle.Yoast(ogImage: TrencinWpArticle.OgImage(urlString:  "https://trencin.sk/wp-content/uploads/2022/10/cintorin-scaled.jpg" ,width:100,height:100,type: "")))
    static let articleUrl = Bundle.main.url(forResource: "ExampleArticle", withExtension: "json")
//    static var article =  TrencinArticleBase(from:  as! Decoder )
    static var previews: some View {
        Text(articleUrl!.relativeString)
//        ArticleView(article: article)
    }
    }

