//
//  BookmarkView.swift
//  NewsDemoSwiftUI
//
//  Created by Prithviraj Patil on 27/11/24.
//

import SwiftUI

struct BookmarkView: View {
    @EnvironmentObject var bookmarkViewModel: BookmarkViewModel

    var body: some View {
        NavigationView {
            if bookmarkViewModel.bookmarkedArticles.isEmpty {
                VStack {
                    Image(systemName: "bookmark")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)
                        .padding()

                    Text("No bookmarks yet")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
                .navigationTitle("Bookmarks")
            } else {
                List(bookmarkViewModel.bookmarkedArticles) { article in
                    NavigationLink(destination: ArticleDetailView(
                        article: article,
                        recommendedArticles: []
                    )) {
                        ArticleCardView(article: article, bookmarkViewModel: _bookmarkViewModel)
                    }
                }
                .navigationTitle("Bookmarks")
            }
        }
    }
}

