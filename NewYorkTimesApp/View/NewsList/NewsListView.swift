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
            List {
                ForEach(viewModel.articles) { e in
                    NewsCell(article: e)
                }
            }
            .navigationTitle("Latest News")
            .onAppear {
                viewModel.fetchArticles()
            }
        }
    }
    
}

#Preview {
    NewsListView()
}
