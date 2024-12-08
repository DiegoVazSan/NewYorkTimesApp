//
//  ArticleDetailView.swift
//  NewYorkTimesApp
//
//  Created by Diego Vazquez Sanchez on 08/12/24.
//

import SwiftUI

struct ArticleDetailView: View {
    let article: ArticleModel
    
    var body: some View {
        Text(article.title)
    }
}

#Preview {
    ArticleDetailView(article: ArticleModel(
        title: "A Neurologist’s Tips to Protect Your Memory",
        author: "By Hope Reese",
        publishedDate: "2022-07-06",
        description: "A new book by a renowned brain expert says there are a few simple things we can do to prevent memory decline as we age.",
        updated: "2023-06-22 01:23:55",
        media: [
            Media(
                mediaMetadata: [
                    MediaMetadata(
                        url: "https://static01.nyt.com/images/2022/07/19/well/05Well-BetterMemory/05Well-BetterMemory-thumbStandard.jpg",
                        format: "Standard Thumbnail",
                        height: 75,
                        width: 75
                    ),
                    MediaMetadata(
                        url: "https://static01.nyt.com/images/2022/07/19/well/05Well-BetterMemory/05Well-BetterMemory-mediumThreeByTwo210.jpg",
                        format: "mediumThreeByTwo210",
                        height: 140,
                        width: 210
                    ),
                    MediaMetadata(
                        url: "https://static01.nyt.com/images/2022/07/19/well/05Well-BetterMemory/05Well-BetterMemory-mediumThreeByTwo440.jpg",
                        format: "mediumThreeByTwo440",
                        height: 293,
                        width: 440
                    )
                ]
            )
        ]
    )
    )
}
