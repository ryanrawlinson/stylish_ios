//
//  ProductViewModel.swift
//  Stylish
//
//  Created by Ryan Rawlinson on 8/19/25.
//

import Foundation

@Observable
class ProductViewModel {
    var product: Product?
    var isFavorite: Bool = false
    
    init(product: Product?) {
        self.product = product
    }
    
    func onFavoriteTapped() {
        isFavorite = !isFavorite
    }
}
