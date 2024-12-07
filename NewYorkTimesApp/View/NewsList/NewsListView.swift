//
//  NewsListView.swift
//  NewYorkTimesApp
//
//  Created by Diego Vazquez Sanchez on 05/12/24.
//

import SwiftUI

struct NewsListView: View {
    
    @ObservedObject var viewModel: NewsListVM = NewsListVM()
    
    var body: some View {
        NavigationStack {
            Group {
                
                switch self.viewModel.state {
                case .inactive:
                    NewsImage()
                    
                case .loading:
                    ProgressView("Loading...")
                    
                case .success(let articles):
                    List(articles) { article in
                        NewsCell(article: article)
                    }
                    
                case .failure(let errorMsg):
                    VStack {
                        Text("Error: \(errorMsg)")
                            .foregroundColor(.red)
                        Button("Retry") {
                            viewModel.fetchArticles()
                        }
                    }
                }
                
            }
            .navigationTitle("main_title".localized())
            .onAppear {
                viewModel.fetchArticles()
            }
        }
    }
}

#Preview {
    NewsListView()
}
