//
//  NewsResponseModel.swift
//  NewYorkTimesApp
//
//  Created by Diego Vazquez Sanchez on 05/12/24.
//

import Foundation

struct MediaMetadata: Codable {
    let url: String
    let format: String
    let height: Int
    let width: Int
}


struct Media: Codable {
    let mediaMetadata: [MediaMetadata]

    enum CodingKeys: String, CodingKey {
        case mediaMetadata = "media-metadata"
    }
}

struct ArticleModel: Codable, Identifiable {
    var id: String { title + publishedDate }
    let title: String
    let author: String
    let publishedDate: String
    let description: String
    let updated: String
    let media: [Media]

    enum CodingKeys: String, CodingKey {
        case title
        case author = "byline"
        case publishedDate = "published_date"
        case description = "abstract"
        case updated
        case media
    }
}


struct NewsResponseModel : Codable {
    var status : String
    var results : [ArticleModel]
}
