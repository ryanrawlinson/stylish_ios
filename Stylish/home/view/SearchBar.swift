//
//  SearchBar.swift
//  Stylish
//
//  Created by Ryan Rawlinson on 8/15/25.
//

import SwiftUI

struct SearchBar: View {
    var body: some View {
        HStack {
            Image("Search")
            TextField("search_text", text: .constant(""))
            Image("Mic")
        }
        .padding(12)
        .overlay(RoundedRectangle(cornerRadius: 8)
            .stroke(Color.gray, lineWidth: 0.5))
    }
}

#Preview {
    SearchBar()
}
