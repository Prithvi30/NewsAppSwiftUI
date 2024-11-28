//
//  BookmarkViewModel.swift
//  NewsDemoSwiftUI
//
//  Created by Prithviraj Patil on 27/11/24.
//

import Foundation

@MainActor
class BookmarkViewModel: ObservableObject {
    @Published var bookmarkedArticles: [Article] = []

    func toggleBookmark(article: Article) {
        if let index = bookmarkedArticles.firstIndex(where: { $0.id == article.id }) {
            // Remove the bookmark if it already exists
            bookmarkedArticles.remove(at: index)
        } else {
            // Add the article to bookmarks
            bookmarkedArticles.append(article)
        }
    }

    func isBookmarked(article: Article) -> Bool {
        return bookmarkedArticles.contains(where: { $0.id == article.id })
    }

}
