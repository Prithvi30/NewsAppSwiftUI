//
//  ArticleDetailViewModelTests.swift
//  NewsDemoSwiftUITests
//
//  Created by Prithviraj Patil on 28/11/24.
//

import XCTest
@testable import NewsDemoSwiftUI

@MainActor
final class ArticleDetailsViewModelTests: XCTestCase {

    var viewModel: ArticleDetailViewModel!
    var mockAPI: MockArticleDetailsAPI!

    override func setUp() {
        super.setUp()
        mockAPI = MockArticleDetailsAPI()
        viewModel = ArticleDetailViewModel(
            detail: nil,
            isLoading: false,
            errorMessage: nil,
            api: mockAPI // Inject the mock API
        )
    }

    override func tearDown() {
        viewModel = nil
        mockAPI = nil
        super.tearDown()
    }

    func testFetchFullArticleSuccess() async {
        let mockDetail = ArticleDetail(
            title: "Mock Title",
            description: "Mock Description",
            content: "Mock Content",
            author: "Mock Author",
            url: "https://example.com/mock",
            urlToImage: "https://example.com/image.jpg",
            publishedAt: "2024-11-28T10:00:00Z"
        )
        mockAPI.mockDetail = mockDetail
        await viewModel.fetchFullArticle(articleUrl: "https://example.com/mock")

        XCTAssertEqual(viewModel.detail?.title, "Mock Title")
        XCTAssertEqual(viewModel.detail?.description, "Mock Description")
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
    }

    func testFetchFullArticleFailure() async {
        mockAPI.shouldReturnError = true
        await viewModel.fetchFullArticle(articleUrl: "https://example.com/mock")

        XCTAssertNil(viewModel.detail)
        XCTAssertFalse(viewModel.isLoading)
    }
}
