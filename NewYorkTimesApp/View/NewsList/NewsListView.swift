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
                List {
                    ForEach(viewModel.articles) { e in
                        NewsCell(article: e)
                    }
                }
                .navigationTitle("main_title".localized())
                .onAppear {
                    viewModel.fetchArticles()
                }
                .alert("Error", isPresented: $viewModel.showErrorAlert) {
                    Button("Retry") {
                        viewModel.fetchArticles()
                    }
                } message: {
                    Text(viewModel.errorMessage ?? "")
                }
                
                if viewModel.isLoading {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                    ProgressView("Cargando...")
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                }
            }
        }
    }
    
}

#Preview {
    NewsListView()
}
