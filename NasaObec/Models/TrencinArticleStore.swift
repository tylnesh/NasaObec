//
//  ArticleStore.swift
//  NasaObec
//
//  Created by Michal Kohútek on 29/10/2022.
//

import Foundation

class TrencinArticleStore: ObservableObject {
    @Published var articles: [TrencinArticleBase] = []
    static let urlString = "https://trencin.sk/wp-json/wp/v2/posts"

    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                       in: .userDomainMask,
                                       appropriateFor: nil,
                                       create: false)
            .appendingPathComponent("trencinArticles.data")
    }
    
    
    static func getNewestArticleIds() async throws -> [ArticleId] {
        guard let url = URL(string: urlString + "?_fields=id") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        let (data, _) = try await URLSession.shared.data(for: request)
        let idArray = try JSONDecoder().decode([ArticleId].self, from: data)
        return idArray
    }
    
    static func isUpToDate() async throws -> Bool {
        let idArray = try await getNewestArticleIds()
        let articles = try await load()
        
        var oldArticleIds:[ArticleId] = []
        
        for article in articles {
            oldArticleIds.append(ArticleId(id: article.id!))
        }
        var articlesUpToDate = true
        for id in idArray {
            articlesUpToDate = oldArticleIds.contains { $0.id == id.id }
            if (!articlesUpToDate) {
                return false
            }
        }
        return articlesUpToDate
    }
    
    static func fetchArticles() async throws -> [TrencinArticleBase] {
        var articles:[TrencinArticleBase] = []
        let idArray = try await getNewestArticleIds()
        
        for articleId in idArray {
            do {
                let postUrl = URL(string: urlString + "/\(articleId.id)")!
                var postRequest = URLRequest(url: postUrl)
                postRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
                postRequest.httpMethod = "GET"
                let (postData, _) = try await URLSession.shared.data(for: postRequest)
                let article = try JSONDecoder().decode(TrencinArticleBase.self, from: postData)
                articles.append(article)
            } catch {
                print(error.localizedDescription)
            }
        }
        return articles
    }

    struct ArticleId:Codable {
        var id:Int
    }
    
    static func load() async throws -> [TrencinArticleBase] {
        do {
            let fileURL = try fileURL()
            guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                return []
            }
            let articles = try JSONDecoder().decode([TrencinArticleBase].self, from: file.availableData)
            return articles
        } catch {
            print(error)
            return []
        }
    }
    
    @discardableResult
    static func save(articles: [TrencinArticleBase]) async throws -> Int {
        do {
            let data = try JSONEncoder().encode(articles)
            let outfile = try fileURL()
            try data.write(to: outfile)
            return articles.count
        }   catch {
            print(error)
        }
        return 0
    }
    
}
