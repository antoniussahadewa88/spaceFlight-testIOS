//
//  MockArticleRepository.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 13/11/25.
//

import Foundation

final class MockArticleRepository: ArticleRepository {
    func fetchArticles(
        limit: Int,
        offset: Int,
        ordering: String?,
        titleContains: String?,
        newsSite: String?
    ) async throws -> [Article] {
        return Article.mockArticles
    }
}
