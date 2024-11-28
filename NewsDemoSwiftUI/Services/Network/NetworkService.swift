//
//  NetworkService.swift
//  NewsDemoSwiftUI
//
//  Created by Prithviraj Patil on 27/11/24.
//

import Foundation

class NetworkService {
    /// Generic fetch function to make network requests and decode responses
    func fetch<T: Codable>(_ url: URL, decodingType: T.Type) async throws -> T {
        // Perform the network request
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Check the HTTP response
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        // Validate the status code
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.statusCodeError(httpResponse.statusCode)
        }
        
        // Ensure there is data
        guard !data.isEmpty else {
            throw NetworkError.noData
        }
        
        // Log the response for debugging
        if let jsonString = String(data: data, encoding: .utf8) {
            print("Response JSON: \(jsonString)")
        }
        
        // Attempt to decode the response
        do {
            return try JSONDecoder().decode(decodingType, from: data)
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}
