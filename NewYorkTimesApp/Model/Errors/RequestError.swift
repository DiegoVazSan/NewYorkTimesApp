//
//  RequestError.swift
//  NewYorkTimesApp
//
//  Created by Diego Vazquez Sanchez on 06/12/24.
//

import Foundation

enum RequestError: Error, LocalizedError {
    case invalidURL
    case networkError(Error)
    case noData
    case decodingError(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("Invalid URL.",
                                     comment: "Error when the URL is invalid")
        case .networkError(let error):
            return NSLocalizedString("Network error: \(error.localizedDescription)",
                                     comment: "Error with the network request")
        case .noData:
            return NSLocalizedString("No data in the response.",
                                     comment: "No data found in the network response")
        case .decodingError(let error):
            return NSLocalizedString("Decoding error: \(error.localizedDescription)",
                                     comment: "Error when decoding data")
        }
    }
}
