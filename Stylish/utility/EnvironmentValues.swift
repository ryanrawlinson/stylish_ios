//
//  EnvironmentValues.swift
//  Stylish
//
//  Created by Ryan Rawlinson on 8/19/25.
//

import SwiftUICore

private struct ProductViewModelEnvironmentKey: EnvironmentKey {
    static let defaultValue: ProductViewModel = .init(product: nil)
}

extension EnvironmentValues {
    var productViewModel: ProductViewModel {
        get {
            self[ProductViewModelEnvironmentKey.self]
        } set {
            self[ProductViewModelEnvironmentKey.self] = newValue
        }
    }
}
