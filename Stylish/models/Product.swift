//
//  File.swift
//  Stylish
//
//  Created by Ryan Rawlinson on 7/25/25.
//

import Foundation

struct Product: Decodable, Identifiable, Hashable {
    var id: Int
    var title: String
    var image: String
    var price: Int
    var description: String
    var brand: String
    var model: String
    var color: String
    var category: String
    var popular: Bool
    var discount: Int?
}
