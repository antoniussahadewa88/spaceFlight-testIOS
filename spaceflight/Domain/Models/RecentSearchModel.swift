//
//  RecentSearchModel.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 08/11/25.
//

import Foundation

struct RecentSearchModel: Identifiable, Equatable {
    let id = UUID()
    let query: String
    let timestamp: Date
}
