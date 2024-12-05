//
//  NewModel.swift
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

struct ArticleModel: Codable {
    let title: String
    let byline: String
    let publishedDate: String
    let abstract: String
    let updated: String
    let media: [Media]

    enum CodingKeys: String, CodingKey {
        case title
        case byline
        case publishedDate = "published_date"
        case abstract
        case updated
        case media
    }
}


struct NewsResponseModel : Codable {
    var status : String
    var results : [ArticleModel]
}


/*
 Populares
 
 
 DETALLE
 titulo
 autor -> byline
 fecha de publicacion
 contenido -> (abstract
 
 
 
 
 
 */
