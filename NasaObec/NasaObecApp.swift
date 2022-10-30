//
//  NasaObecApp.swift
//  NasaObec
//
//  Created by Michal Kohútek on 10/10/2022.
//

import SwiftUI

@main
struct NasaObecApp: App {
    let articleUrl = "https://trencin.sk/wp-json/wp/v2/posts"
    @StateObject private var store = TrencinArticleStore()
    
    var articles = TrencinWpArticle.sampleArticles
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ArticleListView(articles: store.articles)
            }.task {
                do {
                    store.articles = try await TrencinArticleStore.fetchArticles(from: articleUrl)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
