//
//  ArticleListView.swift
//  NewsDemoSwiftUI
//
//  Created by Prithviraj Patil on 27/11/24.
//

import SwiftUI

struct ArticleListView: View {
    @StateObject private var viewModel = ArticleListViewModel()
    @State private var selectedCategory = "Technology"

    private let categories = ["Technology", "Sports", "Health", "Business", "Entertainment", "Science"]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    // Header
                    HeaderView()

                    // Breaking News Carousel
                    if !viewModel.articles.isEmpty {
                        BreakingNewsCarouselView(articles: Array(viewModel.articles.prefix(3)))
                            .frame(height: 250)
                    }

                    // Category Section
                    CategoryView(categories: categories, selectedCategory: $selectedCategory) {
                        Task {
                            await viewModel.fetchArticles(for: selectedCategory)
                        }
                    }

                    // Article Cards
                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.articles) { article in
                            NavigationLink(
                                destination: ArticleDetailView(
                                    article: article,
                                    recommendedArticles: viewModel.articles.filter { $0.id != article.id }
                                )
                            ) {
                                ArticleCardView(article: article)
                                    .padding(.horizontal)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .background(Color(.systemGroupedBackground))
            .task {
                await viewModel.fetchArticles(for: "technology")
            }
        }
    }
}

struct BreakingNewsCarouselView: View {
    let articles: [Article]

    var body: some View {
        TabView {
            ForEach(articles) { article in
                BreakingNewsView(article: article)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct BreakingNewsView: View {
    let article: Article

    var body: some View {
        VStack() {
            if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                        .cornerRadius(12)
                } placeholder: {
                    ProgressView()
                        .frame(height: 200)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(12)
                }
            }

            Text(article.title)
                .font(.headline)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .foregroundColor(.primary)
        }
        .padding(.horizontal)
    }
}
