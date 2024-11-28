//
//  ArticleAPI.swift
//  NewsDemoSwiftUI
//
//  Created by Prithviraj Patil on 27/11/24.
//

import Foundation

class ArticleAPI {
    private let networkService = NetworkService()
    private let baseURL = "https://newsapi.org/v2"
    private let apiKey = "5a3df503ccde49838f6e815038a83003"

    /// Fetch a list of articles for a specific category
    func fetchArticles(category: String) async throws -> [Article] {
        guard let url = URL(string: "\(baseURL)/top-headlines?category=\(category)&apiKey=\(apiKey)") else {
            throw NetworkError.invalidURL
        }

        // Use the network service to fetch the articles
        let response: ArticleResponse = try await networkService.fetch(url, decodingType: ArticleResponse.self)
        return response.articles
    }

    /// Fetch full article details based on its URL
    func fetchFullArticle(articleUrl: String) async throws -> ArticleDetail {
        guard let url = URL(string: "\(baseURL)/everything?q=\(articleUrl)&apiKey=\(apiKey)") else {
            throw NetworkError.invalidURL
        }

        // Use the network service to fetch the full article details
        return try await networkService.fetch(url, decodingType: ArticleDetail.self)
    }
}

