//
//  NewsListView.swift
//  NewsListView
//
//  Created by chandresh patel on 11/09/24.
//

import SwiftUI

import SwiftUI

struct NewsListView: View {
    @StateObject var viewModel = NewsViewModel()
    @State private var selectedCategory = "All"

    let categories = ["All", "Technology", "Sports", "Business", "Health", "Entertainment"]

    var body: some View {
        NavigationView {
            VStack {
                CategoryPickerView(selectedCategory: $selectedCategory, categories: categories) { newCategory in
                    viewModel.fetchNews(for: newCategory)
                }
                
                List(viewModel.articles) { article in
                    NavigationLink(destination: ArticleDetailView(article: article, viewModel: viewModel)) {
                        VStack(alignment: .leading) {
                            Text(article.title).font(.headline)
                            Text(article.description ?? "")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                NavigationLink(destination: BookmarksView(viewModel: viewModel)) {
                    Text("View Bookmarks")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            .onAppear {
                viewModel.fetchNews(for: "technology")
            }
            .navigationBarTitle("News")
        }
    }
}
