//
//  NasaObecApp.swift
//  NasaObec
//
//  Created by Michal Kohútek on 10/10/2022.
//

import SwiftUI

@main
struct NasaObecApp: App {
    @StateObject private var store = TrencinArticleStore()
        
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ArticleListView(articles: $store.articles) {
                    Task {
                        do {
                            let upToDate = try await TrencinArticleStore.isUpToDate()
                            if (!upToDate) {
                                store.articles = try await TrencinArticleStore.fetchArticles()
                                try await TrencinArticleStore.save(articles: store.articles)
                            }
                        } catch {
//                            errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.")
                            print(error)
                        }
                    }
                }
            }.task {
                do {
                    store.articles = try await TrencinArticleStore.load()
                    let upToDate = try await TrencinArticleStore.isUpToDate()
                    if (!upToDate) {
                        store.articles = try await TrencinArticleStore.fetchArticles()
                        try await TrencinArticleStore.save(articles: store.articles)
                    }

                } catch {
                    print(error)
                }
            }
            
        }
    }
}
