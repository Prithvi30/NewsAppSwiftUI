//
//  CategoryView.swift
//  NewsDemoSwiftUI
//
//  Created by Prithviraj Patil on 28/11/24.
//

import SwiftUI

struct CategoryView: View {
    let categories: [String]
    @Binding var selectedCategory: String
    let onCategorySelected: () -> Void

    init(categories: [String], selectedCategory: Binding<String>, onCategorySelected: @escaping () -> Void) {
        self.categories = categories
        self._selectedCategory = selectedCategory
        self.onCategorySelected = onCategorySelected

        // Pre-select the first category if none is already selected
        if selectedCategory.wrappedValue.isEmpty, let firstCategory = categories.first {
            selectedCategory.wrappedValue = firstCategory
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) { // Spacing between buttons
                    ForEach(categories, id: \.self) { category in
                        Button(action: {
                            selectedCategory = category
                            onCategorySelected()
                        }) {
                            Text(category)
                                .font(.headline) // Larger font for readability
                                .padding(.vertical, 12)
                                .padding(.horizontal, 16)
                                .frame(minWidth: 100) // Ensures consistent width
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: selectedCategory == category
                                            ? [.purple, .blue]
                                            : [.gray.opacity(0.2), .gray.opacity(0.5)]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .foregroundColor(selectedCategory == category ? .white : .black)
                                .cornerRadius(10) // Rounded corners for a smooth rectangle look
                                .shadow(color: .gray.opacity(0.3), radius: 4, x: 2, y: 2) // Adds a subtle shadow
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
