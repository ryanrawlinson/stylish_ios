//
//  HomeViewModel.swift
//  Stylish
//
//  Created by Ryan Rawlinson on 7/29/25.
//

import Foundation

@MainActor
@Observable
class HomeViewModel {
    var products: [ProductViewModel] = []
    var categories: [CategoryViewModel] = []
    
    private var errorMessage: String?
    
    func fetchProducts() async {
        do {
            let response = try await APIService.shared.fetch(from: APIEndpoint.products.url, type: [Product].self)
            self.products = response.map(ProductViewModel.init)
        } catch {
            errorMessage = error.localizedDescription
            print("Error Message: \(errorMessage ?? "Unknown Error")")
        }
        
        let categoryNames = Array(Set(products.map {  $0.product?.category }))
        self.categories = categoryNames.enumerated().map { index, name in
            CategoryViewModel(category: Category(id: index, name: name ?? "New Products"))
        }
    }
    
    func selectCategory(_ viewModel: CategoryViewModel) {
        categories.first(where: { $0.category.id == viewModel.category.id })?.isSelected.toggle()
    }
}
