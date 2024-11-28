//
//  ArticleListViewModelTests.swift
//  NewsDemoSwiftUITests
//
//  Created by Prithviraj Patil on 28/11/24.
//

import XCTest
@testable import NewsDemoSwiftUI

@MainActor
class ArticleListViewModelTests: XCTestCase {
    var viewModel: ArticleListViewModel!
    var mockAPI: MockArticleAPI!
    
    override func setUp() {
        super.setUp()
        mockAPI = MockArticleAPI()
        viewModel = ArticleListViewModel(api: mockAPI)
    }
    
    override func tearDown() {
        viewModel = nil
        mockAPI = nil
        super.tearDown()
    }
    
    func testFetchFullArticleSuccess() async {
        let mockDetail = [
            Article(
                source: Source(id: "id", name: "name"),
                author: "Mock Author",
                title: "Mock Title",
                description: "Mock Description",
                url: "Mock Content",
                urlToImage: "https://example.com/mock",
                publishedAt: "https://example.com/image.jpg",
                content: "2024-11-28T10:00:00Z"
            ),
            Article(
                source: Source(id: "2", name: "Mock Source 2"),
                author: "Mock Author 2",
                title: "Mock Article 2",
                description: "Mock Description 2",
                url: "https://example.com/2",
                urlToImage: "https://example.com/image2.jpg",
                publishedAt: "2024-11-28T11:00:00Z",
                content: "Mock Content 2"
            )
        ]
        
        mockAPI.mockArticles = mockDetail
        
        await viewModel.fetchArticles(for: "Technology")
        
        XCTAssertEqual(viewModel.articles.count, 2)
        XCTAssertEqual(viewModel.articles.first?.title, "Mock Title")
        XCTAssertEqual(viewModel.articles.last?.title, "Mock Article 2")
    }
    
    func testFetchArticlesFailure() async {
        mockAPI.shouldReturnError = true
        await viewModel.fetchArticles(for: "Technology")
        
        XCTAssertTrue(viewModel.articles.isEmpty)
    }
}
