//
//  RecentSearchViewModel.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 08/11/25.
//

import Foundation
import Combine

@MainActor
final class RecentSearchViewModel: ObservableObject {
    @Published var searches: [RecentSearchModel] = []
    private let useCase: RecentSearchUseCase

    init(useCase: RecentSearchUseCase) {
        self.useCase = useCase
        load()
    }

    func add(_ q: String) {
        useCase.add(query: q)
        load()
    }

    func load() {
        searches = useCase.getAll()
    }

    func clear() {
        useCase.clear()
        load()
    }
}
