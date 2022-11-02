//
//  TrencinArticleExcerptView.swift
//  NasaObec
//
//  Created by Michal Kohútek on 26/10/2022.
//

import SwiftUI

struct TrencinArticleExcerptView: View {
    let article: TrencinArticleBase

        
        var body: some View {
            VStack(alignment: .leading) {
                Text(article.strippedTitle.string).font(.title).multilineTextAlignment(.center)
                AsyncImage(url: URL(string: (article.yoastHeadJson?.ogImages?.first!.url!)!)) { image in
                    image.resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }.frame(width:300, height:200)
                Text(article.strippedExcerpt.string)
            }
        }
    }
    
    struct TrencinArticleExcerptView_Previews: PreviewProvider {

//        static var article =  TrencinWpArticle(id: 70600, dateGmt: "", modifiedGmt: "", title: TrencinWpArticle.Title(rendered: "Testing Title"),  excerpt: TrencinWpArticle.Excerpt(rendered: "<p>S blížiacim sa Sviatkom všetkých svätých došlo opäť k úprave otváracej doby cintorínov. Tie sú v Trenčíne verejnosti prístupné v týchto dňoch až do 4.novembra od 7.00 do 20.00 h. V&nbsp;týchto dňoch je pohrebiskám venovaná zvýšená pozornosť aj zo strany prevádzkovateľa, ktorým je Pohrebníctvo Dvonč. Pri cintorínoch sú pristavené veľkoobjemové kontajnery na odpad z&nbsp;hrobových miest. Kancelária správy pohrebiska [&#8230;]</p>\n<p><a class=\"btn btn-secondary understrap-read-more-link\" href=\"https://trencin.sk/aktuality/cintoriny-su-az-do-4-novembra-otvorene-dlhsie/\">Čítať viac&#8230;</a></p>"), content: TrencinWpArticle.Content(rendered: "Lorem ipsum dolor blablabla") , mediaLink: TrencinWpArticle.Yoast(ogImage: TrencinWpArticle.OgImage(urlString:  "https://trencin.sk/wp-content/uploads/2022/10/cintorin-scaled.jpg" ,width:100,height:100,type: "")))
        static var previews: some View {
            Text("blabla")
//            TrencinArticleExcerptView(article: article).background(article.mainColor)
        }
    }
    

