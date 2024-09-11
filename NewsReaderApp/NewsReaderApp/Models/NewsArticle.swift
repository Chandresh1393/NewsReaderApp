//
//  NewsArticle.swift
//  NewsArticle
//
//  Created by chandresh patel on 11/09/24.
//


import Foundation

struct NewsArticle: Identifiable, Codable {
    let id = UUID()  // This will automatically generate a unique ID for each article
    let source: NewsSource
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [NewsArticle]
}

struct NewsSource: Codable {
    let id: String?
    let name: String
}
