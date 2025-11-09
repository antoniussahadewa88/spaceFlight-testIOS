//
//  ArticleRepositoryImpl.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 08/11/25.
//

import Foundation
import Combine

final class ArticleRepositoryImpl: ArticleRepository {
    private let api: SpaceFlightAPI

    init(api: SpaceFlightAPI) {
        self.api = api
    }

    func fetchArticles(limit: Int, offset: Int, ordering: String?, titleContains: String?, newsSite: String?) async throws -> [Article] {
        let page = try await api.fetchArticles(limit: limit, offset: offset, ordering: ordering, titleContains: titleContains, newsSite: newsSite)
        return page.results.map { $0.toDomain() }
    }
}
