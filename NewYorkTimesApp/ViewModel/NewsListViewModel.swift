//
//  NewsListViewModel.swift
//  NewYorkTimesApp
//
//  Created by Diego Vazquez Sanchez on 05/12/24.
//

import Foundation

class NewsListVM : ObservableObject {
    @Published var articles : [ArticleModel] = []
    
    
    func fetchArticles() {
        guard let url = APIConfig.getArticlesURL() else {
                    print("URL inválida")
                    return
                }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
                    if let error = error {
                        print("Error en la solicitud: \(error)")
                        return
                    }
                    
                    guard let data = data else {
                        print("Sin datos en la respuesta")
                        return
                    }
                    
                    do {
                        let decodedResponse = try JSONDecoder().decode(NewsResponseModel.self, from: data)
                        DispatchQueue.main.async {
                            self.articles = decodedResponse.results
                        }
                    } catch {
                        print("Error al decodificar: \(error)")
                    }
                }.resume()
    }
    
}
