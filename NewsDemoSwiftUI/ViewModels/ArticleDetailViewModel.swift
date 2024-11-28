//
//  ArticleDetailViewModel.swift
//  NewsDemoSwiftUI
//
//  Created by Prithviraj Patil on 27/11/24.
//

import Foundation

@MainActor
class ArticleDetailViewModel: ObservableObject {
    @Published var detail: ArticleDetail?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    public var api = ArticleAPI()
    
    init(detail: ArticleDetail? = nil, isLoading: Bool, errorMessage: String? = nil, api: ArticleAPI = ArticleAPI()) {
        self.detail = detail
        self.isLoading = isLoading
        self.errorMessage = errorMessage
        self.api = api
    }

    func fetchFullArticle(articleUrl: String) async {
        isLoading = true
        errorMessage = nil
        do {
            self.detail = try await api.fetchFullArticle(articleUrl: articleUrl)
        } catch {
            self.errorMessage = "Failed to fetch article details: \(error.localizedDescription)"
        }
        isLoading = false
    }
}


extension String {
    func removeTruncatedSuffix() -> String {
        if let range = self.range(of: "[+") {
            return String(self[..<range.lowerBound]).trimmingCharacters(in: .whitespacesAndNewlines)
        }
        return self
    }
}
