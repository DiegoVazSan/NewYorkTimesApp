//
//  MockNetworkSession.swift
//  NewYorkTimesAppTests
//
//  Created by Diego Vazquez Sanchez on 09/12/24.
//

import Combine
import Foundation
@testable import NewYorkTimesApp


class MockNetworkSession: NetworkSession {
    
    var mockData: Data?
    var mockError: URLError?
    
    func publisher(for url: URL) -> AnyPublisher<(data: Data, response: URLResponse), URLError> {
        
        if let error = mockError {
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        let mockResponse = URLResponse(url: url, mimeType: "application/json", expectedContentLength: mockData?.count ?? 0, textEncodingName: nil)
        
        return Just((data: mockData ?? Data(), response: mockResponse))
            .setFailureType(to: URLError.self)
            .eraseToAnyPublisher()
    }
}
