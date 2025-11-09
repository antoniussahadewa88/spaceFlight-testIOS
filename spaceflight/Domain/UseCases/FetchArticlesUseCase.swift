//
//  FetchArticlesUseCase.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 08/11/25.
//

import Foundation

protocol FetchArticlesUseCase {
    func execute(limit: Int, offset: Int, ordering: String?, titleContains: String?, newsSite: String?) async throws -> [Article]
}

final class FetchArticlesUseCaseImpl: FetchArticlesUseCase {
    private let repo: ArticleRepository
    init(repo: ArticleRepository) { self.repo = repo }

    func execute(limit: Int = 20, offset: Int = 0, ordering: String? = nil, titleContains: String? = nil, newsSite: String? = nil) async throws -> [Article] {
        return try await repo.fetchArticles(limit: limit, offset: offset, ordering: ordering, titleContains: titleContains, newsSite: newsSite)
    }
}
