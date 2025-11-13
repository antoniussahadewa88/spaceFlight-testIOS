//
//  Report.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 13/11/25.
//

import Foundation

struct Report: Identifiable, Equatable {
    let id: Int
    let title: String
    let authors: [ReportAuthor]
    let url: URL?
    let imageUrl: URL?
    let newsSite: String?
    let summary: String?
    let publishedAt: Date?
    let updatedAt: Date?
}

// ini Supporting Models
struct ReportAuthor: Equatable {
    let name: String
    let socials: ReportSocials
}

struct ReportSocials: Equatable {
    let x: String?
    let youtube: String?
    let instagram: String?
    let linkedin: String?
    let mastodon: String?
    let bluesky: String?
}

// ini DTO (For Decoding JSON)
struct ReportResponseDTO: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [ReportDTO]
}

struct ReportDTO: Codable {
    let id: Int
    let title: String
    let authors: [ReportAuthorDTO]
    let url: String?
    let image_url: String?
    let news_site: String?
    let summary: String?
    let published_at: String?
    let updated_at: String?
}

struct ReportAuthorDTO: Codable {
    let name: String
    let socials: ReportSocialsDTO
}

struct ReportSocialsDTO: Codable {
    let x: String?
    let youtube: String?
    let instagram: String?
    let linkedin: String?
    let mastodon: String?
    let bluesky: String?
}

// ini Mapper (DTO → Domain)
extension ReportResponseDTO {
    func toDomain() -> [Report] {
        results.map { $0.toDomain() }
    }
}

extension ReportDTO {
    func toDomain() -> Report {
        let iso = ISO8601DateFormatter()
        return Report(
            id: id,
            title: title,
            authors: authors.map { $0.toDomain() },
            url: URL(string: url ?? ""),
            imageUrl: URL(string: image_url ?? ""),
            newsSite: news_site,
            summary: summary,
            publishedAt: published_at.flatMap { iso.date(from: $0) },
            updatedAt: updated_at.flatMap { iso.date(from: $0) }
        )
    }
}

extension ReportAuthorDTO {
    func toDomain() -> ReportAuthor {
        ReportAuthor(name: name, socials: socials.toDomain())
    }
}

extension ReportSocialsDTO {
    func toDomain() -> ReportSocials {
        ReportSocials(
            x: x,
            youtube: youtube,
            instagram: instagram,
            linkedin: linkedin,
            mastodon: mastodon,
            bluesky: bluesky
        )
    }
}
