//
//  ArticleCardView.swift
//  NewsDemoSwiftUI
//
//  Created by Prithviraj Patil on 28/11/24.
//

import SwiftUI

struct ArticleCardView: View {
    let article: Article
    @EnvironmentObject var bookmarkViewModel: BookmarkViewModel

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Article Image
            if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 1)
                } placeholder: {
                    ProgressView()
                        .frame(width: 100, height: 100)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }

            // Article Title and Description
            VStack(alignment: .leading, spacing: 6) {
                Text(article.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)

                if let description = article.description {
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                }

                Spacer()

                Text(article.publishedAtFormatted)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            // Bookmark Button
            Button(action: {
                bookmarkViewModel.toggleBookmark(article: article)
            }) {
                Image(systemName: bookmarkViewModel.isBookmarked(article: article) ? "bookmark.fill" : "bookmark")
                    .font(.title3)
                    .foregroundColor(bookmarkViewModel.isBookmarked(article: article) ? .blue : .gray)
            }
        }
        .padding(12)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2) 
    }
}
