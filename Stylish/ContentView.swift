//
//  ContentView.swift
//  Stylish
//
//  Created by Ryan Rawlinson on 7/24/25.
//

import SwiftUI

struct ContentView: View {
    @State private var products: [Product] = []
    @State private var errorMessage: String?
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(products) { product in
                            ProductCard(product: product)
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image("HamburgerMenu")
                    }
                    
                    ToolbarItem(placement: .principal) {
                        Image("ToolbarLogo")
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Image("Profile")
                    }
                }
                .task {
                    await loadProducts()
                }
            
        }
    }
    
    func loadProducts() async {
        do {
            let response = try await APIService.shared.fetch(from: APIEndpoint.products.url, type: [Product].self)
            self.products = response
        } catch {
            errorMessage = error.localizedDescription
            print("Error Message: \(errorMessage ?? "Unknown Error")")
        }
    }
}

struct ProductListItem: View {
    var product: Product
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: product.image), scale: 2) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "photo")
            }
            .frame(width: 75, height: 75)
            .clipShape(.rect(cornerRadius: 8))
            
            Text(product.title)
                .font(.headline)
                .lineLimit(3)
            Spacer()
            Text("$\(product.price)")
                .font(.headline)
        }
    }
}

#Preview {
    ContentView()
}
