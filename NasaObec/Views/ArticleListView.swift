//
//  ArticleListView.swift
//  NasaObec
//
//  Created by Michal Kohútek on 28/10/2022.
//

import SwiftUI

struct ArticleListView: View {
    
    @Binding var articles: [TrencinWpArticle]
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: ()->Void

    var body: some View {
        List {
            ForEach(articles) { article in
                NavigationLink(destination: ArticleView(article: article)) {
                    TrencinArticleExcerptView(article: article)
                }
            }
        }
        .navigationTitle("Trenčín - oznamy")
        .toolbar {
            Button(action: {
                saveAction()
            }) {
                Image(systemName:"arrow.2.squarepath")
            }
        }
        
    }
}

struct ArticleListView_Previews: PreviewProvider {
  
    static var previews: some View {
        
        ArticleListView(articles: .constant(TrencinWpArticle.sampleArticles!), saveAction: {})
    }
}
