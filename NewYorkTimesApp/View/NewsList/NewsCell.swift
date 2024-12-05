//
//  NewsCell.swift
//  NewYorkTimesApp
//
//  Created by Diego Vazquez Sanchez on 05/12/24.
//

import SwiftUI

struct NewsCell: View {
    //var article : ArticleModel
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark")
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .padding(.trailing, 8)
            
            VStack(alignment: .leading) {
                Text("Cell")
                    .font(.headline)
                Text("Cell Description")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    NewsCell()
}
