//
//  NewsListView.swift
//  NewYorkTimesApp
//
//  Created by Diego Vazquez Sanchez on 05/12/24.
//

import SwiftUI

struct NewsListView: View {
    var body: some View {
        NavigationStack {
            List(1..<10) { item in
                NewsCell()
            }
            .navigationTitle("News")
        }
    }
    
}

#Preview {
    NewsListView()
}
