//
//  NewsListViewModel.swift
//  NewYorkTimesApp
//
//  Created by Diego Vazquez Sanchez on 05/12/24.
//

import Foundation

class NewsListVM : ObservableObject {
    
    enum ViewState<T> {
            case inactive
            case loading
            case success(T)
            case failure(String)
        }
    
    @Published var state: ViewState<[ArticleModel]> = .inactive
    
    func fetchArticles() {
        
        state = .loading
        
        NetworkManager.fetchArticles { [weak self] result in
            
            DispatchQueue.main.async {
                
                switch result {
                    
                case .success(let articles):
                    self?.state = .success(articles)
                    
                case .failure(let error):
                    self?.state = .failure(error.localizedDescription)
                }
            }
            
        }
    }
    
}
