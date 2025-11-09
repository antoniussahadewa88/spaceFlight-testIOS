//
//  ArticleRepository.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 08/11/25.
//

import Foundation

protocol ArticleRepository {
    func fetchArticles(limit: Int, offset: Int, ordering: String?, titleContains: String?, newsSite: String?) async throws -> [Article]
}
