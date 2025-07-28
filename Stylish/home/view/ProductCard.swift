//
//  ProductGridCard.swift
//  Stylish
//
//  Created by Ryan Rawlinson on 7/28/25.
//

import SwiftUI

let placeholderImageURLString = "https://storage.googleapis.com/fir-auth-1c3bc.appspot.com/1692255251854-xbox.jpg"

struct ProductGridCard: View {
    var body: some View {
        let product: Product = Product(id: 1, title: "Microsoft Xbox Series X", image: placeholderImageURLString, price: 57, description: "Experience the ultimate gaming console with lightning-fast loading times, stunning graphics, and immersive gameplay.", brand: "microsoft", model: "Xbox Series X", color: "white", category: "gaming", popular: true, onSale: nil, discount: 4)
        VStack() {
                AsyncImage(url: URL(string: placeholderImageURLString)!) { phase in
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
                
                Spacer()
                
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
                        .padding(.top, 4)
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
    ProductGridCard()
}
