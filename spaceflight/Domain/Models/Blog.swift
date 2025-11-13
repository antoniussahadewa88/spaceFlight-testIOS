//
//  Blog.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 13/11/25.
//

import Foundation

struct Blog: Identifiable, Equatable {
    let id: Int
    let title: String
    let authors: [Author]
    let url: URL?
    let imageUrl: URL?
    let newsSite: String?
    let summary: String?
    let publishedAt: Date?
    let updatedAt: Date?
    let featured: Bool
    let launches: [BlogLaunch]
    let events: [BlogEvent]
}

struct Author: Equatable {
    let name: String
    let socials: Socials
}

struct Socials: Equatable {
    let x: String?
    let youtube: String?
    let instagram: String?
    let linkedin: String?
    let mastodon: String?
    let bluesky: String?
}

struct BlogLaunch: Equatable {
    let id: String?
    let provider: String?
}

struct BlogEvent: Equatable {
    let id: String?
    let provider: String?
}

// MARK: - Mapper
extension BlogDTO {
    func toDomain() -> Blog {
        let iso = ISO8601DateFormatter()
        return Blog(
            id: id,
            title: title,
            authors: authors.map { $0.toDomain() },
            url: URL(string: url ?? ""),
            imageUrl: URL(string: image_url ?? ""),
            newsSite: news_site,
            summary: summary,
            publishedAt: published_at.flatMap { iso.date(from: $0) },
            updatedAt: updated_at.flatMap { iso.date(from: $0) },
            featured: featured,
            launches: launches.map { $0.toDomain() },
            events: events.map { $0.toDomain() }
        )
    }
}

extension AuthorDTO {
    func toDomain() -> Author {
        Author(name: name, socials: socials.toDomain())
    }
}

extension SocialsDTO {
    func toDomain() -> Socials {
        Socials(
            x: x,
            youtube: youtube,
            instagram: instagram,
            linkedin: linkedin,
            mastodon: mastodon,
            bluesky: bluesky
        )
    }
}

extension BlogLaunchDTO {
    func toDomain() -> BlogLaunch {
        BlogLaunch(id: launch_id, provider: provider)
    }
}

extension BlogEventDTO {
    func toDomain() -> BlogEvent {
        BlogEvent(id: event_id.map { "\($0)" }, provider: provider)
    }
}
