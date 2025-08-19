//
//  CategoryButton.swift
//  Stylish
//
//  Created by Ryan Rawlinson on 8/18/25.
//

import SwiftUI

struct CategoryButton: View {
    @ObservedObject var viewModel: CategoryViewModel
    
    var onTap: (() -> Void)?
    
    var body: some View {
        Text(viewModel.category.name.capitalized)
            .padding(.vertical, 8)
            .padding(.horizontal, 14)
            .background(viewModel.isSelected ? .black : .clear)
            .foregroundColor(viewModel.isSelected ? .white : .black)
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(Color(red: 0.90, green: 0.90, blue: 0.90), lineWidth: 1))
            .onTapGesture {
                withAnimation(.easeInOut) {
                    self.onTap?()
                }
            }
    }
}

#Preview {
    CategoryButton(viewModel: CategoryViewModel(category: Category(id: 1, name: "Electronics", isSelected: false)))
}
