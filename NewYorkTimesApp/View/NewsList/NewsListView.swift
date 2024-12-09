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
            ZStack {
                Color("MainColor").ignoresSafeArea(.all)
                
                Group {
                    
                    switch self.viewModel.state {
                    case .inactive:
                        NewsImage()
                        
                    case .loading:
                        ProgressView("loading".localized())
                        
                    case .success(let articles):
                        List(articles) { article in
                            NavigationLink(
                                destination: ArticleDetailView(viewModel: self.viewModel, article: article)
                            ) {
                                NewsCell(article: article)
                                    .listRowBackground(Color.clear)
                                    .listRowSeparator(.hidden)
                            }
                        }
                        .listStyle(PlainListStyle())
                        .scrollIndicators(.hidden)
                        
                    case .failure(let errorMsg):
                        ErrorView(msg: errorMsg, action: viewModel.fetchArticles)
                    }
                    
                }
            }
            .navigationTitle("main_title".localized())
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SavedNewsView()) {
                        Image(systemName: "star.circle.fill")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    NewsListView()
}
