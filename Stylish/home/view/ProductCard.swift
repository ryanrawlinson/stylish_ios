//
//  ProductGridCard.swift
//  Stylish
//
//  Created by Ryan Rawlinson on 7/28/25.
//

import SwiftUI

let placeholderImageURLString = "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"

struct ProductCard: View {

    @State var viewModel: ProductViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let imageUrl = URL(string: viewModel.product!.image) {
                ZStack(alignment: .topTrailing) {
                    AsyncImage(url: imageUrl) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: 161, height: 150)
                                .clipped()
                                .cornerRadius(16)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 161, height: 150)
                                .clipped()
                                .cornerRadius(16)
                        case .failure:
                            Image(systemName: "exclamationmark.triangle.fill")
                                .foregroundColor(.red)
                                .font(.largeTitle)
                                .frame(width: 161, height: 150)
                                .clipped()
                                .cornerRadius(16)
                                .background(.gray.opacity(0.1))
                        @unknown default:
                            EmptyView()
                        }
                    }
                    
                    
                    FavoriteButtonView()
                        .padding(10)
                        
                }
            } else {
                // Fallback for invalid imageUrl
                Image(systemName: "photo.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 150)
                    .foregroundStyle(.gray)
                    .background(.gray.opacity(0.1))
                    .onAppear {
                        print("DEBUG: Product '\(viewModel.product?.title)' has an invalid image URL string: \(viewModel.product?.image)")
                    }
                    .cornerRadius(16)
            }
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 4) {
                Text(viewModel.product!.title)
                    .font(.headline)
                    .lineLimit(1)
                Text("$\(viewModel.product!.price, specifier: "%.2f")")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(.white)
            
        }
        .frame(width: 161, height: 224)
        .background(.white)
        .environment(viewModel)
    }
}

#Preview {
    ProductCard(viewModel: ProductViewModel(product: Product(id: 1, title: "Microsoft Xbox Series X", price: 57.24, description: "Experience the ultimate gaming console with lightning-fast loading times, stunning graphics, and immersive gameplay.", image:  placeholderImageURLString, category: "gaming", rating: Rating(rate: 4.9, count: 123))))
}
