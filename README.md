# NewsReaderApp
NewsReaderApp
This is a simple News Reader iOS application built using SwiftUI and Combine. It fetches news articles from a public API and allows users to:

Browse the latest news articles by category.
View full content of articles.
Bookmark articles for later reading.
Filter news by category.


Features
News Fetching: Fetches the latest news articles from the News API.
Bookmarking: Users can bookmark articles for later reading, which are persisted using UserDefaults.
Category Filtering: Allows filtering of articles by categories like Technology, Sports, Business, and more.
SwiftUI & Combine: Built using the latest iOS development technologies.


Architecture
MVVM (Model-View-ViewModel): The app is built using the MVVM architecture to ensure separation of concerns and better testability.
Combine: Used for handling asynchronous API calls.
SwiftUI: Used for building the user interface.

Prerequisites
Xcode 15 or later
Swift 5.0 or later

Setup Instructions

Clone the Repository:

git clone https://github.com/your-repo/news-reader-app.git
cd news-reader-app

Obtain News API Key:
Sign up at https://newsapi.org/ and get your API key.

Set API Key:
Open NewsAPIService.swift.
Replace YOUR_API_KEY with your actual API key:

private let apiKey = "YOUR_API_KEY"

Run the Project:
Open the .xcodeproj file in Xcode.
Choose an iOS simulator or device, and click Run (Cmd + R).

Project Structure

├── NewsReaderApp/
│   ├── Models/
│   │   ├── NewsArticle.swift
│   │   ├── NewsSource.swift
│   │   └── NewsResponse.swift
│   ├── ViewModels/
│   │   └── NewsViewModel.swift
│   ├── Views/
│   │   ├── NewsListView.swift
│   │   ├── ArticleDetailView.swift
│   │   ├── BookmarksView.swift
│   │   └── CategoryPickerView.swift
│   ├── Services/
│   │   └── NewsAPIService.swift
├── NewsReaderAppTests/
│   ├── NewsViewModelTests.swift
│   └── BookmarkingTests.swift


Models
NewsArticle: Represents a single news article with properties like title, description, url, and content.
NewsSource: Represents the source of the news article.
NewsResponse: Represents the response from the News API.

ViewModels
NewsViewModel: Handles the fetching of articles and bookmarking functionality. Manages the app's state, including articles, filtered articles, and bookmarks.
Views
NewsListView: The main view that displays a list of articles.
ArticleDetailView: Shows detailed content of an article with the ability to bookmark or unbookmark it.
BookmarksView: Displays the list of bookmarked articles.
CategoryPickerView: Allows users to filter articles by categories.

Services
NewsAPIService: Responsible for making network requests to the News API and fetching articles.
Persistence

Bookmarked articles are persisted using UserDefaults. When an article is bookmarked, it is stored in UserDefaults and reloaded when the app is restarted.



