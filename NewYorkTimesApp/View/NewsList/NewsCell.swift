//
//  NewsCell.swift
//  NewYorkTimesApp
//
//  Created by Diego Vazquez Sanchez on 05/12/24.
//

import SwiftUI
import Kingfisher

struct NewsCell: View {
    var article : ArticleModel
    
    var body: some View {
        VStack {
            KFImage(URL(string: article.media.first?.mediaMetadata.last?.url ?? ""))
                .placeholder {
                    ProgressView()
                }
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: .black, radius: 15, x: 5, y: 5)
            
            VStack {
                Text(article.title)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                Text(article.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.bottom, 10)
    }
}
