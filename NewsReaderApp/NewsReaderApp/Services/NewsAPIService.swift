//
//  NewsAPIService.swift
//  NewsAPIService
//
//  Created by chandresh patel on 11/09/24.
//


import Combine
import Foundation

class NewsAPIService {
    static let shared = NewsAPIService()
    private let apiKey = "2e0bf66cc36d4a36843d4bcf272edad9"
    
    func getNews(for category: String) -> AnyPublisher<[NewsArticle], Error> {
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&category=\(category.lowercased())&apiKey=\(apiKey)"
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL")
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: NewsResponse.self, decoder: JSONDecoder())
            .map { $0.articles }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
