//
//  ProductGridCard.swift
//  Stylish
//
//  Created by Ryan Rawlinson on 7/28/25.
//

import SwiftUI

let placeholderImageURLString = "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"

struct ProductCard: View {
    var product: Product

    var body: some View {
        VStack(spacing: 0) {
            AsyncImage(url: URL(string: product.image)!) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: .infinity, height: 150)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: .infinity, height: 150)
                            .clipped()
                    case .failure:
                        Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundColor(.red)
                            .font(.largeTitle)
                            .frame(width: .infinity, height: 150)
                            .background(.gray.opacity(0.1))
                    @unknown default:
                        EmptyView()
                    }
                }
                .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 0, bottomLeading: 8, bottomTrailing: 8, topTrailing: 0)))
                
                VStack(alignment: .leading) {
                    Text(product.title)
                        .font(.headline)
                        .lineLimit(1)
                    Text(product.description)
                        .font(.caption)
                        .fontWeight(.light)
                        .lineLimit(2)
                    Text("$\(product.price, specifier: "%.2f")")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                    
                    HStack(alignment: .center, spacing: 4) {
                        HStack(spacing: 0) {
                            ForEach(0..<Int(product.rating.rate), id: \.self) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .font(.caption)
                            }
                        }
                        
                        
                            Text("(\(product.rating.count))")
                                .font(.caption)
                                .fontWeight(.light)
                                .foregroundStyle(.secondary)
                        
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 2, trailing: 8))
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .background(.white)
                
            }
            .frame(width: 164, height: 245)
            .background(.white)
            .cornerRadius(8)
            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 6)
        }
}

#Preview {
    ProductCard(product: Product(id: 1, title: "Microsoft Xbox Series X", price: 57.24, description: "Experience the ultimate gaming console with lightning-fast loading times, stunning graphics, and immersive gameplay.", image:  placeholderImageURLString, category: "gaming", rating: Rating(rate: 4.9, count: 123)))
}
