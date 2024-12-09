//
//  Item.swift
//  NewYorkTimesApp
//
//  Created by Diego Vazquez Sanchez on 05/12/24.
//

import Foundation
import SwiftData

@Model
final class ArticleItem {
    var id: String
    var title: String
    var author: String
    var publishedDate: String
    var descriptionText: String
    var updatedText: String
    var imgURL: String
    
    init(id: String, title: String, author: String, publishedDate: String,
         descriptionText: String, updatedText: String?, imgURL: String?) {
        
        self.id = id
        self.title = title
        self.author = author
        self.publishedDate = publishedDate
        self.descriptionText = descriptionText
        self.updatedText = updatedText ?? ""
        self.imgURL = imgURL ?? ""
        
    }
    
}
