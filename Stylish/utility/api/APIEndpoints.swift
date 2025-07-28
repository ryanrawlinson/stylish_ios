//
//  APIEndpoints.swift
//  Stylish
//
//  Created by Ryan Rawlinson on 7/25/25.
//

import Foundation

enum APIEndpoint {
    case products
    
    var path: String {
        switch self {
        case .products:
            return "/products"
        }
    }
    
    var url: String {
        return APIConfig.baseURL + path
    }
}
