//
//  ContentView.swift
//  NewsDemoSwiftUI
//
//  Created by Prithviraj Patil on 27/11/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var bookmarkViewModel = BookmarkViewModel() // Declare BookmarkViewModel here

    var body: some View {
        TabView {
            // Home Tab
            ArticleListView()
                .environmentObject(bookmarkViewModel) // Inject into ArticleListView
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            
            // Bookmarks Tab
            BookmarkView()
                .environmentObject(bookmarkViewModel) // Inject into BookmarkView
                .tabItem {
                    Label("Bookmarks", systemImage: "bookmark")
                }

            // Profile Tab
            Text("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
        .accentColor(.black) 
    }
}
