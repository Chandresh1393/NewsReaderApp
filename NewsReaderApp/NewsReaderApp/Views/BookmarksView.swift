//
//  BookmarksView.swift
//  NewsReaderApp
//
//  Created by chandresh patel on 11/09/24.
//

import SwiftUI

struct BookmarksView: View {
    @ObservedObject var viewModel: NewsViewModel

    var body: some View {
        NavigationView {
            List(viewModel.bookmarkedArticles) { article in
                NavigationLink(destination: ArticleDetailView(article: article, viewModel: viewModel)) {
                    VStack(alignment: .leading) {
                        Text(article.title).font(.headline)
                        Text(article.description ?? "")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationBarTitle("Bookmarked Articles")
        }
    }
}

