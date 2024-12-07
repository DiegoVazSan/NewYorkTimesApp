//
//  APIConfig.swift
//  NewYorkTimesApp
//
//  Created by Diego Vazquez Sanchez on 06/12/24.
//

import Foundation

struct APIConfig {
    static let baseURL = "https://api.nytimes.com/svc/mostpopular/v2/"
    static let apiKey = "qTl6HA9lEk9bHwEMNSrdjRAceMnSqQEZ"
    
    static func getArticlesURL() -> URL? {
        return URL(string: "\(baseURL)emailed/7.json?api-key=\(apiKey)")
    }
}
