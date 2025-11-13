//
//  MockArticleListViewModel.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 10/11/25.
//

import Foundation
import Combine

final class MockArticleListViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var isLoading: Bool = false

    init() {
        // sample Article sesuai dengan modelmu (URL? dan arrays)
        articles = [
            Article(
                id: 1,
                title: "Spaceflight news — sample 1",
                url: URL(string: "https://example.com/article1"),
                imageUrl: URL(string: "https://via.placeholder.com/150"),
                newsSite: "SpaceNews",
                summary: "This is a sample summary used for preview only.",
                publishedAt: Date(),
                launches: [Launch(id: "asas", provider: "Provider A")],
                events: []
            ),
            Article(
                id: 2,
                title: "Spaceflight news — sample 2",
                url: URL(string: "https://example.com/article2"),
                imageUrl: URL(string: "https://via.placeholder.com/150"),
                newsSite: "SpaceDaily",
                summary: "Another sample summary.",
                publishedAt: Date(),
                launches: [Launch(id: "as", provider: "Provider B")],
                events: []
            )
        ]
    }

    // optional: fungsi yang mirip fetchAll() kalau view memanggilnya di .task
    func fetchAll() async {
        // noop for preview
    }
}
