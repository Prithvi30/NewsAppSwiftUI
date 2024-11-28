//
//  Article.swift
//  NewsDemoSwiftUI
//
//  Created by Prithviraj Patil on 27/11/24.
//

import Foundation

struct Article: Codable, Identifiable {
    var id: String {
        return url
    }

    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

struct Source: Codable {
    let id: String?
    let name: String
}

extension Article {
    var imageUrl: URL? {
        if let urlToImage = urlToImage {
            return URL(string: urlToImage)
        }
        return nil
    }
}

struct ArticleDetail: Codable {
    let title: String
    let description: String?
    let content: String?
    let author: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
}

extension Article {
    var publishedAtFormatted: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" 
        guard let date = formatter.date(from: publishedAt) else { return "Unknown Date" }

        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

