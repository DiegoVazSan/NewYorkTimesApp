//
//  SavedNewsView.swift
//  NewYorkTimesApp
//
//  Created by Diego Vazquez Sanchez on 09/12/24.
//

import SwiftData
import SwiftUI

struct SavedNewsView: View {
    var viewModel: SavedNewsVM = SavedNewsVM()
    @Query var savedArticles: [ArticleItem]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("saved_articles".localized())
                    .font(.title)
                    .bold()
                    .padding(.horizontal)
                    .padding(.bottom)
                
                VStack(spacing: 0) {
                    ForEach(savedArticles) { item in
                        NewsCell(article: viewModel.getArticleModelFrom(item))
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            .padding(.horizontal)
                            .padding(.bottom, 8)
                    }
                }
            }
            .padding(.vertical)
        }
        .scrollIndicators(.hidden)
    }

}

#Preview {
    SavedNewsView()
}
