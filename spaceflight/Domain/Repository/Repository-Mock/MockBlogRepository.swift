//
//  MockBlogRepository.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 13/11/25.
//

import Foundation

final class MockBlogRepository: BlogRepository {
    func fetchBlog(
        limit: Int,
        offset: Int,
        ordering: String?,
        titleContains: String?,
        newsSite: String?
    ) async throws -> [Blog] {
        return Blog.mockBlogs
    }
}
