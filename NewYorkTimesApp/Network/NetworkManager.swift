//
//  NetworkManager.swift
//  NewYorkTimesApp
//
//  Created by Diego Vazquez Sanchez on 06/12/24.
//

import Combine
import Foundation

class NetworkManager {
    
    static func fetchArticles() -> AnyPublisher<[ArticleModel], RequestError> {
        guard let url = APIConfig.getArticlesURL() else {
            return Fail(error: RequestError.invalidURL).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .tryMap { data -> [ArticleModel] in
                do {
                    let decodedResponse = try JSONDecoder().decode(NewsResponseModel.self, from: data)
                    return decodedResponse.results
                } catch {
                    throw RequestError.decodingError(error)
                }
            }
            .mapError { error in
                (error as? RequestError) ?? RequestError.networkError(error)
            }
            .eraseToAnyPublisher()
    }
}

