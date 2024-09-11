import Combine
import SwiftUI

class NewsViewModel: ObservableObject {
    @Published var articles = [NewsArticle]()
    @Published var bookmarkedArticles = [NewsArticle]() {
        didSet {
            saveBookmarks()
        }
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadBookmarks()
    }

    func fetchNews(for category: String) {
        NewsAPIService.shared.getNews(for: category)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] newsArticles in
                self?.articles = newsArticles
            })
            .store(in: &cancellables)
    }
    
    // MARK: - Bookmarking
    func bookmarkArticle(_ article: NewsArticle) {
        if !bookmarkedArticles.contains(where: { $0.url == article.url }) {
            bookmarkedArticles.append(article)
        }
    }
    
    func unbookmarkArticle(_ article: NewsArticle) {
        if let index = bookmarkedArticles.firstIndex(where: { $0.url == article.url }) {
            bookmarkedArticles.remove(at: index)
        }
    }
    
    // MARK: - Persistence (UserDefaults)
    func saveBookmarks() {
        if let encodedData = try? JSONEncoder().encode(bookmarkedArticles) {
            UserDefaults.standard.set(encodedData, forKey: "bookmarkedArticles")
        }
    }
    
    func loadBookmarks() {
        if let savedData = UserDefaults.standard.data(forKey: "bookmarkedArticles"),
           let loadedArticles = try? JSONDecoder().decode([NewsArticle].self, from: savedData) {
            bookmarkedArticles = loadedArticles
        }
    }
}
