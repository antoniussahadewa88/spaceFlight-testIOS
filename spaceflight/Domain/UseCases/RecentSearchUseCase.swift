//
//  RecentSearchUseCase.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 08/11/25.
//

import Foundation

protocol RecentSearchUseCase {
    func add(query: String)
    func getAll() -> [RecentSearchModel]
    func clear()
}

final class RecentSearchUseCaseImpl: RecentSearchUseCase {
    private let repo: RecentSearchRepository
    init(repo: RecentSearchRepository) { self.repo = repo }

    func add(query: String) { repo.addSearch(query: query) }
    func getAll() -> [RecentSearchModel] { repo.fetchAll(limit: 20) }
    func clear() { repo.clearAll() }
}
