//
//  APIError.swift
//  Stylish
//
//  Created by Ryan Rawlinson on 7/24/25.
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingFailed(Error)
    case statusCode(Int)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .requestFailed(let error):
            return "Request failed: \(error.localizedDescription)"
        case .invalidResponse:
            return "Invalid response"
        case .decodingFailed(let error):
            return "Failed to decoding response: \(error.localizedDescription)"
        case .statusCode(let code):
            return "Server responded with status code: \(code)"
        }
    }
}
