import SwiftUI

struct ArticleDetailView: View {
    var article: NewsArticle
    @ObservedObject var viewModel: NewsViewModel
    
    var isBookmarked: Bool {
        viewModel.bookmarkedArticles.contains { $0.url == article.url }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(article.title)
                .font(.largeTitle)
            
            if let content = article.content {
                Text(content)
            }

            // Link to full article
            if let url = URL(string: article.url) {
                Link("Read Full Article", destination: url)
                    .font(.headline)
                    .padding(.top)
            }
            
            // Bookmark/Unbookmark Button
            Button(action: {
                if isBookmarked {
                    viewModel.unbookmarkArticle(article)
                } else {
                    viewModel.bookmarkArticle(article)
                }
            }) {
                Text(isBookmarked ? "Remove Bookmark" : "Bookmark Article")
                    .foregroundColor(.blue)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 1)
                    )
            }
        }
        .padding()
        .navigationBarTitle("Article", displayMode: .inline)
    }
}
