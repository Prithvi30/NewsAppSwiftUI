//
//  Bookmark.swift
//  NewsDemoSwiftUI
//
//  Created by Prithviraj Patil on 27/11/24.
//

import Foundation

struct Bookmark: Identifiable {
    let id = UUID()
    let article: Article
    let dateAdded: Date
}
