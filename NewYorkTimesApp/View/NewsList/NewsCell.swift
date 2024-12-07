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
            
            NewsImage(urlString: article.media.first?.mediaMetadata.last?.url)
                .padding(.horizontal)
            
            VStack {
                Text(article.title)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                Text(article.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }.padding()
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.5), radius: 5, x: 4, y: 4)
        .padding(.horizontal, 10)
        .padding(.bottom, 10)
    }
}




struct NewsImage: View {
    var urlString: String?
    
    var body: some View {
        Group {
            if let imgUrlString = urlString, let url = URL(string: imgUrlString) {
                KFImage(url)
                    .placeholder {
                        ProgressView()
                    }
                    .resizable()
                    .scaledToFit()
            } else {
                Image(Config.defaultImage)
                    .resizable()
                    .scaledToFit()
            }
        }
        .frame(width: 300, height: 300)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black, radius: 15, x: 5, y: 5)
        .padding(.bottom, 10)
    }
}
