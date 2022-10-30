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
    let article: TrencinWpArticle
   
    var body: some View {
        ZStack{
            VStack {
                Text((article.title.rendered )).font(.headline).padding(.bottom)
                Spacer()
                ScrollView {
                    RichText(html:article.content.rendered ).foregroundColor(light: Color.black, dark: Color.white)
                }
            }.padding(30)
                .navigationBarTitle(Text(article.title.rendered ), displayMode: .automatic)
        }
    }


struct MunicipalityView_Previews: PreviewProvider {
    static var article =  TrencinWpArticle(id: 0, dateGmt: "", modifiedGmt: "", title: TrencinWpArticle.Title(rendered: "Testing Title"),  content: TrencinWpArticle.Content(rendered: "Lorem ipsum dolor blablabla"), mediaLink: TrencinWpArticle.Yoast(ogImage: TrencinWpArticle.OgImage(urlString:  "https://trencin.sk/wp-content/uploads/2022/10/cintorin-scaled.jpg" ,width:100,height:100,type: "")))
    static var previews: some View {
        ArticleView(article: article)
    }
    }
}
