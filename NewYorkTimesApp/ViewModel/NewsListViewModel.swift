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
    @Published var showErrorAlert : Bool = false
    @Published var isLoading: Bool = false
    
    func fetchArticles() {
        isLoading = true
        NetworkManager.fetchArticles { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let articles):
                    self.articles = articles
                    self.showErrorAlert = false
                case .failure(let error):
                    self.handleError(error)
                }
                self.isLoading = false
            }
        }
    }

    
    private func handleError(_ error: RequestError) {
        
        print(error.localizedDescription)
        DispatchQueue.main.async {
            self.errorMessage = error.localizedDescription
            self.showErrorAlert = true
            self.isLoading = false
        }
        
    }
    
}
