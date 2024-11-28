//
//  ErrorHandler.swift
//  NewsDemoSwiftUI
//
//  Created by Prithviraj Patil on 27/11/24.
//

import Foundation

/// Custom Network Errors
enum NetworkError: Error, LocalizedError {
    case invalidURL
    case requestFailed
    case invalidResponse
    case decodingFailed
    case noData
    case statusCodeError(Int)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The provided URL is invalid."
        case .requestFailed:
            return "The network request failed."
        case .invalidResponse:
            return "The server response was invalid."
        case .decodingFailed:
            return "Failed to decode the response."
        case .noData:
            return "No data was returned by the server."
        case .statusCodeError(let statusCode):
            return "Request failed with status code \(statusCode)."
        }
    }
}
