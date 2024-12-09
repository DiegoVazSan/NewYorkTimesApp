//
//  ArticleDetailView.swift
//  NewYorkTimesApp
//
//  Created by Diego Vazquez Sanchez on 08/12/24.
//

import SwiftUI

struct ArticleDetailView: View {
    //MARK: - Properties
    let viewModel: NewsListVM
    @Environment(\.modelContext) var context
    let article: ArticleModel
    
    //MARK: - UIProperties
    var headerView: some View {
        VStack(alignment: .leading) {
            Text(article.title)
                .fontWeight(.bold)
                .font(.title)
                .padding(.bottom, 5)
            HStack {
                Text(article.author)
                    .foregroundStyle(.gray)
                    .font(.title3)
                Spacer()
            }
        }.padding()
    }
    
    var mainView: some View {
        VStack {
            NewsImage(urlString: article.media.first?.mediaMetadata.last?.url)
                .padding(.horizontal)
            Text(article.description)
                .font(.system(size: 22))
                .padding(.horizontal)
                .padding(.bottom)
            Button("save".localized()) {
                viewModel.saveArticleItem(article, context: context)
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 200)
            .background(Color.black)
            .cornerRadius(12)
            .padding(.bottom)
        }
    }
    
    var footerView: some View {
        VStack {
            Text("publication_date".localized() + article.publishedDate)
                .font(.footnote)
                .foregroundStyle(.gray)
            Text("updated".localized() + article.updated)
                .foregroundStyle(.gray)
                .font(.footnote)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding()
    }
    
    //MARK: - Body
    var body: some View {
        ScrollView {
            VStack {
                headerView
                mainView
                Spacer()
                footerView
            }
        }
    }
}

#Preview {
    ArticleDetailView(viewModel: NewsListVM(), article: ArticleModel(
        title: "A Neurologist’s Tips to Protect Your Memory",
        author: "By Hope Reese",
        publishedDate: "2022-07-06",
        description: "A new book by a renowned brain expert says there are a few simple things we can do to prevent memory decline as we age. A new book by a renowned brain expert says there are a few simple things we can do to prevent memory decline as we age. A new book by a renowned brain expert says there are a few simple things we can do to prevent memory decline as we age. A new book by a renowned brain expert says there are a few simple things we can do to prevent memory decline as we age. A new book by a renowned brain expert says there are a few simple things we can do to prevent memory decline as we age. A new book by a renowned brain expert says there are a few simple things we can do to prevent memory decline as we age.",
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
