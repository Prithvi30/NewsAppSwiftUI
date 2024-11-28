//
//  ArticleListViewModel.swift
//  NewsDemoSwiftUI
//
//  Created by Prithviraj Patil on 27/11/24.
//

import Foundation

@MainActor
class ArticleListViewModel: ObservableObject {
    @Published var articles: [Article] = []
    public var api = ArticleAPI()

    init(api: ArticleAPI = ArticleAPI()) {
        self.api = api
    }

    func fetchArticles(for category: String) async {
        do {
            self.articles = try await api.fetchArticles(category: category)
        } catch {
            print("Error fetching articles: \(error.localizedDescription)")
        }
    }
}
