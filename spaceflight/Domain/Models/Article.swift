//
//  Article.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 08/11/25.
//

import Foundation

import Foundation

struct Article: Identifiable, Equatable {
    let id: Int
    let title: String
    let url: URL?
    let imageUrl: URL?
    let newsSite: String?
    let summary: String?
    let publishedAt: Date?
    let launches: [Launch]
    let events: [Event]
}

struct Launch: Equatable {
    let id: String?
    let provider: String?
}

struct Event: Equatable {
    let id: String?
    let provider: String?
}

extension ArticleDTO {
    func toDomain() -> Article {
        let iso = ISO8601DateFormatter()
        let date = publishedAt.flatMap { iso.date(from: $0) }
        return Article(
            id: id,
            title: title,
            url: URL(string: url ?? ""),
            imageUrl: URL(string: imageUrl ?? ""),
            newsSite: newsSite,
            summary: summary,
            publishedAt: date,
            launches: launches?.map { Launch(id: $0.id, provider: $0.provider) } ?? [],
            events: events?.map { Event(id: $0.id, provider: $0.provider) } ?? []
        )
    }
}
