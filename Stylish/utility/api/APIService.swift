//
//  APIService.swift
//  Stylish
//
//  Created by Ryan Rawlinson on 7/24/25.
//

import Foundation

final class APIService {
    static let shared = APIService()
    
    private init() {}
    
    func fetch<T: Decodable>(from endpoint: String, type: T.Type) async throws -> T {
        guard let url = URL(string: endpoint) else {
            throw APIError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            // Check the response
            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.invalidResponse
            }
            
            // Check for successful status code
            guard 200..<300 ~= httpResponse.statusCode else {
                throw APIError.statusCode(httpResponse.statusCode)
            }
            
            // Decode the response
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw APIError.decodingFailed(error)
            }
        } catch {
            throw APIError.requestFailed(error)
        }
    }
}
