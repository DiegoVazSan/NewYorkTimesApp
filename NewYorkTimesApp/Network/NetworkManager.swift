//
//  NetworkManager.swift
//  NewYorkTimesApp
//
//  Created by Diego Vazquez Sanchez on 06/12/24.
//

import Foundation

class NetworkManager {
    static func fetchArticles(completion: @escaping (Result<[ArticleModel], RequestError>) -> Void) {
        guard let url = APIConfig.getArticlesURL() else {
            completion(.failure(.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let fail = error {
                completion(.failure(.networkError(fail)))
                return
            }

            guard let data = data else {
                completion(.failure(.noData))
                return
            }

            do {
                let decodedResponse = try JSONDecoder().decode(NewsResponseModel.self, from: data)
                completion(.success(decodedResponse.results))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }.resume()
    }
}
