//
//  ArticleStore.swift
//  NasaObec
//
//  Created by Michal Kohútek on 29/10/2022.
//

import Foundation

class TrencinArticleStore: ObservableObject {
    @Published var articles: [TrencinWpArticle] = []
//    @Published var article:TrencinWpArticle = TrencinWpArticle()

    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                       in: .userDomainMask,
                                       appropriateFor: nil,
                                       create: false)
            .appendingPathComponent("trencinArticles.data")
    }
    
    static func fetchArticles(from urlString:String) async throws -> [TrencinWpArticle] {
        guard let url = URL(string: urlString + "?_fields=id") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        let (data, _) = try await URLSession.shared.data(for: request)
        var articles:[TrencinWpArticle] = []

        let idArray = try JSONDecoder().decode([ArticleId].self, from: data)
        print(idArray)
        
        for articleId in idArray {
            let postUrl = URL(string: urlString + "/\(articleId.id)")!
            var postRequest = URLRequest(url: postUrl)
            postRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            postRequest.httpMethod = "GET"
            let (postData, _) = try await URLSession.shared.data(for: postRequest)
            do {
                let article = try JSONDecoder().decode(TrencinWpArticle.self, from: postData)
                articles.append(article)
            } catch {
                print(error.localizedDescription)
            }
        }
//        articles = try JSONDecoder().decode([TrencinWpArticle].self, from: data)
        return articles
    }

    struct ArticleId:Codable {
        var id:Int
    }
    
}
