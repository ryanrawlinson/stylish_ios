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
    let price: Double
    let description: String
    let image: String
    let category: String
    let rating: Rating
}

