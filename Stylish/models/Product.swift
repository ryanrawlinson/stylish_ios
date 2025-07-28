//
//  Product.swift
//  Stylish
//
//  Created by Ryan Rawlinson on 7/25/25.
//

import Foundation

struct Product: Decodable, Identifiable, Hashable {
    let id: Int
    let title: String
    let image: String
    let price: Int
    let description: String
    let brand: String
    let model: String
    let color: String?
    let category: String
    let popular: Bool?
    let onSale: Bool?
    let discount: Int?
}

