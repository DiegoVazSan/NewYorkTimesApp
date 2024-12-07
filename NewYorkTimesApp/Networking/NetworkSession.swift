//
//  NetworkSession.swift
//  NewYorkTimesApp
//
//  Created by Diego Vazquez Sanchez on 07/12/24.
//

import Combine
import Foundation

protocol NetworkSession {
    func publisher(for url: URL) -> AnyPublisher<(data: Data, response: URLResponse), URLError>
}
