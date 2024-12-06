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
    //article.media.first?.mediaMetadata.first?.url
    
    var body: some View {
        HStack {
            KFImage(URL(string: article.media.first?.mediaMetadata.first?.url ?? ""))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
//                        .placeholder {
//                            ProgressView() // Indicador de carga mientras se descarga la imagen
//                        }
//                        .onFailure { error in
//                            Text("Error al cargar la imagen") // Manejo de errores
//                        }
//                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.headline)
                Text(article.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}
