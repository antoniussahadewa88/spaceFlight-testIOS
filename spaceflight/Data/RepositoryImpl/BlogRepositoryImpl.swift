//
//  BlogRepositoryImpl.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 13/11/25.
//

import Foundation
import Combine

final class BlogRepositoryImpl: BlogRepository {
    private let api: SpaceFlightAPI

    init(api: SpaceFlightAPI) {
        self.api = api
    }

    func fetchBlog(
        limit: Int,
        offset: Int,
        ordering: String?,
        titleContains: String?,
        newsSite: String?
    ) async throws -> [Blog] {
        let page = try await api.fetchBlogs(
            limit: limit,
            offset: offset,
            ordering: ordering,
            titleContains: titleContains,
            newsSite: newsSite
        )
        return page.results.map { $0.toDomain() }
    }
}
