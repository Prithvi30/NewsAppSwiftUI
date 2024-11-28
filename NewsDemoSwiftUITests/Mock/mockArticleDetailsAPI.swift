//
//  mockArticleDetailsAPI.swift
//  NewsDemoSwiftUITests
//
//  Created by Prithviraj Patil on 28/11/24.
//

@testable import NewsDemoSwiftUI
import Foundation

class MockArticleDetailsAPI: ArticleAPI {
    var shouldReturnError: Bool = false
    var mockDetail: ArticleDetail?

    override func fetchFullArticle(articleUrl: String) async throws -> ArticleDetail {
        if shouldReturnError {
            throw URLError(.badServerResponse) // Simulate a network error
        }
        return mockDetail ?? ArticleDetail(
            title: "Mock Title",
            description: "Mock Description",
            content: "Mock Content",
            author: "Mock Author",
            url: "https://example.com/mock",
            urlToImage: "https://example.com/image.jpg",
            publishedAt: "2024-11-28T10:00:00Z"
        )
    }
}
