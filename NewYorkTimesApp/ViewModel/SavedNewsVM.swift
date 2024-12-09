//
//  SavedNewsVM.swift
//  NewYorkTimesApp
//
//  Created by Diego Vazquez Sanchez on 09/12/24.
//

import Foundation

class SavedNewsVM {
    
    func getArticleModelFrom(_ articleItem: ArticleItem) -> ArticleModel {
        ArticleModel(title: articleItem.title, author: articleItem.author,
                     publishedDate: articleItem.publishedDate,
                     description: articleItem.descriptionText,
                     updated: articleItem.updatedText,
                     media: [Media(mediaMetadata: [MediaMetadata(url: articleItem.imgURL, format: "", height: 0, width: 0)])])
    }
    
}
