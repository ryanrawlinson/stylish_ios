//
//  FavoriteButtonView.swift
//  Stylish
//
//  Created by Ryan Rawlinson on 7/30/25.
//

import SwiftUI

struct FavoriteButtonView: View {
    @Environment(\.productViewModel) var viewModel: ProductViewModel
    
    var body: some View {
        ZStack(alignment: .center) {
            if viewModel.isFavorite {
                Image("Heart_Filled")
                    .opacity(0.8)
                    .padding(EdgeInsets(top: 2, leading: 0, bottom: 0, trailing: 0))
            } else {
                Image("Heart")
                    .padding(EdgeInsets(top: 2, leading: 0, bottom: 0, trailing: 0))
            }
                
        }
        .frame(width: 38, height: 38)
        .background(.white)
        .cornerRadius(12)
        .shadow(radius: 4)
        .onTapGesture {
            viewModel.onFavoriteTapped()
        }
    }
}

struct FavoriteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        let mockViewModel = ProductViewModel(product: .init(id: 1, title: "Test Product", price: 100, description: "Test Description", image: "Test Image", category: "Test Category", rating: Rating(rate: 4.5, count: 500)))
        
        FavoriteButtonView()
            .environment(mockViewModel)
    }
}
