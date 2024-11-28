//
//  ArticleDetailView.swift
//  NewsDemoSwiftUI
//
//  Created by Prithviraj Patil on 27/11/24.
//

import SwiftUI

struct ArticleDetailView: View {
    let article: Article
    let recommendedArticles: [Article] // Add recommended articles as input
    @State private var showWebView: Bool = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Article Image
                if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity, maxHeight: 250)
                            .clipped()
                            .cornerRadius(12)
                            .padding(.horizontal)
                    } placeholder: {
                        ProgressView()
                            .frame(maxWidth: .infinity, maxHeight: 250)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(12)
                            .padding(.horizontal)
                    }
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 250)
                        .foregroundColor(.gray)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }

                // Article Title
                Text(article.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .lineSpacing(4)
                    .padding(.horizontal)

                // Article Description
                if let description = article.description {
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                }

                // Article Content
                if let content = article.content {
                    Text(content.removeTruncatedSuffix())
                        .font(.body)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(5)
                        .padding(.horizontal)
                } else {
                    Text("Full content is not available.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                }

                // Open Full Article in WebView
                if let url = URL(string: article.url) {
                    Button(action: {
                        showWebView = true
                    }) {
                        Text("Check out full article in WebView")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .padding(.horizontal)
                    }
                    .sheet(isPresented: $showWebView) {
                        WebView(url: url)
                            .edgesIgnoringSafeArea(.all)
                    }
                }

                // Recommended News Section
                Text("Recommended News")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)

                HStack(spacing: 16) {
                    ForEach(recommendedArticles.prefix(3), id: \.id) { recArticle in
                        VStack {
                            if let imageUrl = recArticle.urlToImage, let url = URL(string: imageUrl) {
                                AsyncImage(url: url) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 100, height: 100)
                                        .background(Color.gray.opacity(0.2))
                                        .clipShape(Circle())
                                }
                            } else {
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.gray)
                                    .clipShape(Circle())
                            }

                            Text(recArticle.title)
                                .font(.caption)
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                .frame(width: 100)
                        }
                    }
                }
                .padding(.horizontal)

                Spacer(minLength: 16)
            }
            .padding(.vertical)
        }
        .background(Color(.systemGroupedBackground)) // Nice background color
        .navigationTitle("Article Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

