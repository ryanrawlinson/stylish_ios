//
//  ProductResponse.swift
//  Stylish
//
//  Created by Ryan Rawlinson on 7/25/25.
//

struct ProductResponse: Decodable {
    let status: String
    let message: String
    let products: [Product]
}

