//
//  NetworkSession+URLSession.swift
//  NewYorkTimesApp
//
//  Created by Diego Vazquez Sanchez on 07/12/24.
//

import Combine
import Foundation

extension URLSession: NetworkSession {
    func publisher(for url: URL) -> AnyPublisher<(data: Data, response: URLResponse), URLError> {
        self.dataTaskPublisher(for: url).eraseToAnyPublisher()
    }
}
