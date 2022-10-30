//
//  ArticleListView.swift
//  NasaObec
//
//  Created by Michal Kohútek on 28/10/2022.
//

import SwiftUI

struct ArticleListView: View {
    
    var articles: [TrencinWpArticle]
    var body: some View {
        List {
            ForEach(articles) { article in
                NavigationLink(destination: ArticleView(article: article)) {
                    TrencinArticleExcerptView(article: article)
                }.listRowBackground(article.mainColor)
            }
        }.navigationTitle("Trenčín - oznamy")
    }
}

struct ArticleListView_Previews: PreviewProvider {
  
    
    
    static var previews: some View {
        
        ArticleListView(articles: TrencinWpArticle.sampleArticles!)
    }
}
