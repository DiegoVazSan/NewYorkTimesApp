//
//  SavedNewsView.swift
//  NewYorkTimesApp
//
//  Created by Diego Vazquez Sanchez on 09/12/24.
//

import SwiftData
import SwiftUI

struct SavedNewsView: View {
    @Query var items: [ArticleItem]
    
    var body: some View {
        Text("Saved articles")
            .font(.title)
        
         List(items) { i in
             
             NewsCell(article: ArticleModel(title: i.title, author: i.author, publishedDate: i.publishedDate, description: i.descriptionText, updated: i.updatedText, media: [Media(mediaMetadata: [MediaMetadata(url: i.imgURL, format: "", height: 0, width: 0)])]))
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
