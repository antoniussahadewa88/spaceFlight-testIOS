//
//  Article.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 08/11/25.
//

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

extension Article {
    static let mockArticles: [Article] = [
        Article(
            id: 1,
            title: "NASA Successfully Launches Artemis II Mission",
            url: URL(string: "https://example.com/artemis"),
            imageUrl: URL(string: "https://example.com/artemis.jpg"),
            newsSite: "SpaceNews",
            summary: "NASA has successfully launched the Artemis II mission to orbit the Moon.",
            publishedAt: ISO8601DateFormatter().date(from: "2025-11-12T10:00:00Z"),
            launches: [
                Launch(id: "abc123", provider: "NASA")
            ],
            events: [
                Event(id: "ev123", provider: "SpaceX")
            ]
        ),
        Article(
            id: 2,
            title: "SpaceX Starship Completes Test Flight",
            url: URL(string: "https://example.com/starship"),
            imageUrl: URL(string: "https://example.com/starship.jpg"),
            newsSite: "SpaceFlight Insider",
            summary: "Starship reached orbit and landed successfully, marking a new milestone.",
            publishedAt: ISO8601DateFormatter().date(from: "2025-11-10T15:30:00Z"),
            launches: [],
            events: []
        )
    ]
}
