//
//  NewsListViewModel.swift
//  NewYorkTimesApp
//
//  Created by Diego Vazquez Sanchez on 05/12/24.
//

import Combine
import Foundation
import SwiftData

class NewsListVM : ObservableObject {
    
    enum ViewState<T> {
            case inactive
            case loading
            case success(T)
            case failure(String)
        }
    
    @Published var state: ViewState<[ArticleModel]> = .inactive
    private var networkManager: NetworkManager
    private var cancellables = Set<AnyCancellable>()
    
    init(networkManager: NetworkManager = NetworkManager()) {
            self.networkManager = networkManager
            fetchArticles()
        }
    
    func fetchArticles() {
        
        state = .loading
        
        networkManager.fetchArticles()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.state = .failure(error.localizedDescription)
                }
            } receiveValue: { [weak self] articles in
                self?.state = .success(articles)
            }
            .store(in: &cancellables)
    }
    
    func saveArticleItem(_ item: ArticleModel, context: ModelContext) {
            let newItem = ArticleItem(id: item.id, title: item.title,
                                      author: item.author, publishedDate: item.publishedDate,
                                      descriptionText: item.description, updatedText: item.updated,
                                      imgURL: item.media.first?.mediaMetadata.last?.url ?? "")
            context.insert(newItem)
            do {
                    try context.save()
                } catch {
                    print("Error al guardar: \(error)")
                }
            
    }
    
}
