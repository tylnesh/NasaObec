//
//  TrencinArticleExcerptView.swift
//  NasaObec
//
//  Created by Michal Kohútek on 26/10/2022.
//

import SwiftUI

struct TrencinArticleExcerptView: View {
    let article: TrencinWpArticle

        
        var strippedExcerpt:NSAttributedString {
            do {
                let attributedString = try NSAttributedString(data:(article.excerpt.rendered.data(using: .utf16))!, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil )
                return attributedString
            } catch {
                print(error)
            }
            return NSAttributedString("")
        }
        
        
        var body: some View {
            VStack(alignment: .leading) {
                Text(article.title.rendered).font(.headline)
                Spacer()
                HStack{
                    if (article.evenCount) {
                        AsyncImage(url: URL(string: article.mediaLink.ogImages.first!.url)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }.frame(width:150, height:100)
                        Text(strippedExcerpt.string).foregroundColor(article.accentColor)

                    } else {
                        Text(strippedExcerpt.string).foregroundColor(article.accentColor).multilineTextAlignment(.trailing)
                        AsyncImage(url:  URL(string: article.mediaLink.ogImages.first!.url)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }.frame(width:150, height:100)

                    }

                }.font(.caption)
            }.padding()
                .foregroundColor(article.accentColor)
        }
    }
    
    struct TrencinArticleExcerptView_Previews: PreviewProvider {

        static var article =  TrencinWpArticle(id: 70600, dateGmt: "", modifiedGmt: "", title: TrencinWpArticle.Title(rendered: "Testing Title"),  excerpt: TrencinWpArticle.Excerpt(rendered: "<p>S blížiacim sa Sviatkom všetkých svätých došlo opäť k úprave otváracej doby cintorínov. Tie sú v Trenčíne verejnosti prístupné v týchto dňoch až do 4.novembra od 7.00 do 20.00 h. V&nbsp;týchto dňoch je pohrebiskám venovaná zvýšená pozornosť aj zo strany prevádzkovateľa, ktorým je Pohrebníctvo Dvonč. Pri cintorínoch sú pristavené veľkoobjemové kontajnery na odpad z&nbsp;hrobových miest. Kancelária správy pohrebiska [&#8230;]</p>\n<p><a class=\"btn btn-secondary understrap-read-more-link\" href=\"https://trencin.sk/aktuality/cintoriny-su-az-do-4-novembra-otvorene-dlhsie/\">Čítať viac&#8230;</a></p>"), content: TrencinWpArticle.Content(rendered: "Lorem ipsum dolor blablabla") , mediaLink: TrencinWpArticle.Yoast(ogImage: TrencinWpArticle.OgImage(urlString:  "https://trencin.sk/wp-content/uploads/2022/10/cintorin-scaled.jpg" ,width:100,height:100,type: "")))
        static var previews: some View {
            TrencinArticleExcerptView(article: article).background(article.mainColor)
        }
    }
    

