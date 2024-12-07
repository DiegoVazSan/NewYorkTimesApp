//
//  NewsListViewModel.swift
//  NewYorkTimesApp
//
//  Created by Diego Vazquez Sanchez on 05/12/24.
//

import Foundation

class NewsListVM : ObservableObject {
    @Published var articles : [ArticleModel] = []
    @Published var errorMessage : String?
    
    
    func fetchArticles() {
        guard let url = APIConfig.getArticlesURL() else {
            self.handleError(.invalidURL)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let fail = error {
                self.handleError(.networkError(fail))
                return
            }
            
            guard let data = data else {
                self.handleError(.noData)
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(NewsResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.articles = decodedResponse.results
                }
            } catch {
                self.handleError(.decodingError(error))
            }
        }.resume()
    }
    
    private func handleError(_ error: RequestError) {
        
        print(error.localizedDescription)
        DispatchQueue.main.async {
            self.errorMessage = error.localizedDescription
        }
        
    }
    
}
