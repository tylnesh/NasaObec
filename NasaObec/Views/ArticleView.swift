//
//  ContentView.swift
//  NasaObec
//
//  Created by Michal Kohútek on 10/10/2022.
//

import SwiftUI
import RichText

struct ArticleView: View {
    private let trencinWpArticleUrl = "https://trencin.sk/wp-json/wp/v2/posts/70600"

    var article: TrencinWpArticle? {
        do {
            guard let exampleArticleFilePath = Bundle.main.path(forResource: "ExampleArticle", ofType: "json"), let exampleArticleData = FileManager.default.contents(atPath: exampleArticleFilePath) else {
                print ("Cannot open json file")
                return nil
            }
            let decoder = JSONDecoder()
            let exampleArticle = try decoder.decode(TrencinWpArticle.self, from: exampleArticleData)
            return exampleArticle
        }   catch {
                print(error)
        }
       return nil
    }
    
    var attributedArticleContent:NSAttributedString {
        do {
            let attributedString = try NSAttributedString(data:(article?.content.rendered.data(using: .utf16))!, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil )
                return attributedString
            } catch {
                print(error)
            }
        
       
        return NSAttributedString("")

    }
    
   
    var body: some View {
        ZStack{
            Color.gray.ignoresSafeArea()
            VStack {
                Text((article?.title.rendered ?? "No article title")).font(.headline).padding(.bottom)
                Spacer()
                ScrollView {
//                    Text((article?.content.rendered ?? "No article content"))
                    //Text(AttributedString(attributedArticleContent))
                    RichText(html:article?.content.rendered ?? "No article content")
                    
                    
                }
                
            
            }.padding(30)
                .navigationBarTitle(Text(article?.title.rendered ?? "No article title found"), displayMode: .automatic)
                
            
        }
    }


struct MunicipalityView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView()
    }
    }
}
