//
//  ArticleListViewModel.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 08/11/25.
//

import Foundation
import Combine

@MainActor
final class ArticleListViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let fetchUseCase: FetchArticlesUseCase
    private let cacheKey = "last_articles_cache"

    init(fetchUseCase: FetchArticlesUseCase) {
        self.fetchUseCase = fetchUseCase
        loadCached()
    }

    func loadCached() {
        if let data = UserDefaults.standard.data(forKey: cacheKey),
           let decoded = try? JSONDecoder().decode([ArticleCache].self, from: data) {
            self.articles = decoded.map { $0.toDomain() }
        }
    }

    func fetchAll() async {
        isLoading = true
        do {
            let list = try await fetchUseCase.execute(limit: 20, offset: 0, ordering: nil, titleContains: nil, newsSite: nil)
            articles = list
            cacheList(list)
            isLoading = false
        } catch {
            isLoading = false
            errorMessage = error.localizedDescription
        }
    }

    private func cacheList(_ list: [Article]) {
        let caches = list.map { ArticleCache(from: $0) }
        if let data = try? JSONEncoder().encode(caches) {
            UserDefaults.standard.set(data, forKey: cacheKey)
        }
    }
}

// Simple cache DTO (serializable)
struct ArticleCache: Codable {
    let id: Int
    let title: String
    let url: String?
    let imageUrl: String?
    let newsSite: String?
    let summary: String?
    let publishedAt: String?

    init(from a: Article) {
        id = a.id
        title = a.title
        url = a.url?.absoluteString
        imageUrl = a.imageUrl?.absoluteString
        newsSite = a.newsSite
        summary = a.summary
        publishedAt = a.publishedAt.flatMap { ISO8601DateFormatter().string(from: $0) }
    }

    func toDomain() -> Article {
        Article(
            id: id,
            title: title,
            url: url.flatMap(URL.init),
            imageUrl: imageUrl.flatMap(URL.init),
            newsSite: newsSite,
            summary: summary,
            publishedAt: publishedAt.flatMap { ISO8601DateFormatter().date(from: $0) },
            launches: [],
            events: []
        )
    }
}
