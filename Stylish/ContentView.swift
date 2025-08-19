//
//  ContentView.swift
//  Stylish
//
//  Created by Ryan Rawlinson on 7/24/25.
//

import SwiftUI

struct ContentView: View {
    @State private var homeViewModel: HomeViewModel = .init()
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                HStack {
                    SearchBar()
                    
                    VStack {
                        Image("Filter_White")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .padding()
                            .foregroundStyle(.white)
                            .background(.black)
                    }
                    .cornerRadius(8)
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(homeViewModel.categories, id: \.category.id) { categoryViewModel in
                            CategoryButton(viewModel: categoryViewModel, onTap: {
                                homeViewModel.selectCategory(categoryViewModel)
                            })
                        }
                    }
                    .padding()
                    
                }
                
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(homeViewModel.products, id: \.product?.id) { viewModel in
                        ProductCard(viewModel: viewModel)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Discover")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Image("Bell")
                }
            }
            .task {
                await homeViewModel.fetchProducts()
            }
            
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
