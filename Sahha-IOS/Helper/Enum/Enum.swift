//
//  Enum.swift
//  Sahha-IOS
//
//  Created by Rohit Kumar on 08/08/2024.
//

import Foundation

enum AppEnvironment : String {
    case development
    case production
}

enum NetworkError: Error {
    case noData
    case decodingError
    case invalidResponse
    case badURL
    case customError(error: String)
}
