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
    @Query var items: [ArticleItem]
    
    var body: some View {
        Text("saved_articles".localized())
            .font(.title)
        
         List(items) { i in
             NewsCell(article: viewModel.getArticleModelFrom(i))
                     .listRowBackground(Color.clear)
                     .listRowSeparator(.hidden)
             
         }
         .listStyle(PlainListStyle())
         .scrollIndicators(.hidden)
        
    }
}

#Preview {
    SavedNewsView()
}
