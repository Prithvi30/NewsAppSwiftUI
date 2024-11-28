//
//  BookmarkViewModelTests.swift
//  NewsDemoSwiftUITests
//
//  Created by Prithviraj Patil on 28/11/24.
//

import XCTest
@testable import NewsDemoSwiftUI

@MainActor
final class BookmarkViewModelTests: XCTestCase {

    var viewModel: BookmarkViewModel!

    override func setUp() {
        super.setUp()
        viewModel = BookmarkViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testToggleBookmark_AddsArticle() {
        let article = Article(
            source: Source(id: "1", name: "Mock Source"),
            author: "Mock Author",
            title: "Mock Article",
            description: "Mock Description",
            url: "https://example.com",
            urlToImage: nil,
            publishedAt: "2024-11-28T10:00:00Z",
            content: "Mock Content"
        )

        viewModel.toggleBookmark(article: article)

        XCTAssertTrue(viewModel.bookmarkedArticles.contains(where: { $0.id == article.id }))
    }

    func testToggleBookmark_RemovesArticle() {
        let article = Article(
            source: Source(id: "1", name: "Mock Source"),
            author: "Mock Author",
            title: "Mock Article",
            description: "Mock Description",
            url: "https://example.com",
            urlToImage: nil,
            publishedAt: "2024-11-28T10:00:00Z",
            content: "Mock Content"
        )
        viewModel.bookmarkedArticles.append(article)

        viewModel.toggleBookmark(article: article)

        // Assert
        XCTAssertFalse(viewModel.bookmarkedArticles.contains(where: { $0.id == article.id }))
    }

    func testIsBookmarked_ReturnsTrue() {
        let article = Article(
            source: Source(id: "1", name: "Mock Source"),
            author: "Mock Author",
            title: "Mock Article",
            description: "Mock Description",
            url: "https://example.com",
            urlToImage: nil,
            publishedAt: "2024-11-28T10:00:00Z",
            content: "Mock Content"
        )
        viewModel.bookmarkedArticles.append(article)

        let result = viewModel.isBookmarked(article: article)
        XCTAssertTrue(result)
    }

    func testIsBookmarked_ReturnsFalse() {
        let article = Article(
            source: Source(id: "1", name: "Mock Source"),
            author: "Mock Author",
            title: "Mock Article",
            description: "Mock Description",
            url: "https://example.com",
            urlToImage: nil,
            publishedAt: "2024-11-28T10:00:00Z",
            content: "Mock Content"
        )

        let result = viewModel.isBookmarked(article: article)
        XCTAssertFalse(result)
    }
}
