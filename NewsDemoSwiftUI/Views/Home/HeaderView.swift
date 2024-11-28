//
//  HeaderView.swift
//  NewsDemoSwiftUI
//
//  Created by Prithviraj Patil on 28/11/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Welcome,")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("Brandon Calzoni")
                    .font(.title2.bold())
            }

            Spacer()

            Button(action: {
                // Action for search button
            }) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.gray)
            }
            .padding(.trailing, 8)

            Button(action: {
                // Action for profile button
            }) {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color(.systemGroupedBackground))
        .overlay(
            RoundedRectangle(cornerRadius: 0)
                .stroke(Color.gray.opacity(0.5), lineWidth: 2)
        )
    }
}

#Preview {
    HeaderView()
}
