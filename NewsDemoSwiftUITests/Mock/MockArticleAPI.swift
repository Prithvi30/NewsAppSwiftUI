//
//  MockArticleAPI.swift
//  NewsDemoSwiftUITests
//
//  Created by Prithviraj Patil on 28/11/24.
//


@testable import NewsDemoSwiftUI
import Foundation

class MockArticleAPI: ArticleAPI {
    var shouldReturnError = false
    var mockArticles: [Article] = [] // Add this property to simulate articles

    override func fetchArticles(category: String) async throws -> [Article] {
        if shouldReturnError {
            throw URLError(.badServerResponse) // Simulate an error response
        }
        return mockArticles // Return mock data when no error is simulated
    }
}
