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
                Color.indigo.ignoresSafeArea(.all)
                
                Group {
                    
                    switch self.viewModel.state {
                    case .inactive:
                        NewsImage()
                        
                    case .loading:
                        ProgressView("loading".localized())
                        
                    case .success(let articles):
                        List(articles) { article in
                            NewsCell(article: article)
                        }
                        .listStyle(PlainListStyle())
                        .listRowSeparator(.hidden)
                        .scrollIndicators(.hidden)
                        
                    case .failure(let errorMsg):
                        VStack {
                            Text("error_message".localized())
                                .foregroundColor(.red)
                            Text("(\(errorMsg))")
                            Button("retry".localized()) {
                                viewModel.fetchArticles()
                            }
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
