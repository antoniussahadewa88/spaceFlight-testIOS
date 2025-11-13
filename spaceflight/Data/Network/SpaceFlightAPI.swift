//
//  SpaceFlightAPI.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 08/11/25.
//

import Foundation
import Alamofire

nonisolated(unsafe) struct ArticleDTO: Decodable, Sendable {
    let id: Int
    let title: String
    let url: String?
    let imageUrl: String?
    let newsSite: String?
    let summary: String?
    let publishedAt: String?
    let launches: [LaunchDTO]?
    let events: [EventDTO]?
}

nonisolated(unsafe) struct LaunchDTO: Decodable, Sendable {
    let id: String?
    let provider: String?
}

nonisolated(unsafe) struct EventDTO: Decodable, Sendable {
    let id: String?
    let provider: String?
}

nonisolated(unsafe) struct PagedResponse<T: Decodable & Sendable>: Decodable, Sendable {
    let count: Int
    let results: [T]
}


nonisolated(unsafe) struct BlogDTO: Decodable, Sendable {
    let id: Int
    let title: String
    let authors: [AuthorDTO]
    let url: String?
    let image_url: String?
    let news_site: String?
    let summary: String?
    let published_at: String?
    let updated_at: String?
    let featured: Bool
    let launches: [BlogLaunchDTO]
    let events: [BlogEventDTO]
}

nonisolated(unsafe) struct AuthorDTO: Decodable, Sendable {
    let name: String
    let socials: SocialsDTO
}

nonisolated(unsafe) struct SocialsDTO: Decodable, Sendable {
    let x: String?
    let youtube: String?
    let instagram: String?
    let linkedin: String?
    let mastodon: String?
    let bluesky: String?
}

nonisolated(unsafe) struct BlogLaunchDTO: Decodable, Sendable {
    let launch_id: String?
    let provider: String?
}

nonisolated(unsafe) struct BlogEventDTO: Decodable, Sendable {
    let event_id: Int?
    let provider: String?
}

final class SpaceFlightAPI {
    private let session: Session
    private let base = "https://api.spaceflightnewsapi.net/v4/"

    init(session: Session) {
        self.session = session
    }

    func fetchArticles(limit: Int = 20, offset: Int = 0, ordering: String? = nil, titleContains: String? = nil, newsSite: String? = nil) async throws -> PagedResponse<ArticleDTO> {
        var params: [String: Any] = ["limit": limit, "offset": offset]
        if let o = ordering { params["ordering"] = o }
        if let t = titleContains { params["title_contains"] = t }
        if let s = newsSite { params["news_site"] = s }

        let url = "\(base)articles"
        return try await session.request(url, parameters: params)
            .serializingDecodable(PagedResponse<ArticleDTO>.self)
            .value
    }

    func fetchBlogs(limit: Int = 20,offset: Int = 0,ordering: String? = nil,titleContains: String? = nil,newsSite: String? = nil
        ) async throws -> PagedResponse<BlogDTO> {
            var params: [String: Any] = [
                "limit": limit,
                "offset": offset
            ]

            if let o = ordering { params["ordering"] = o }
            if let t = titleContains { params["title_contains"] = t }
            if let s = newsSite { params["news_site"] = s }

            let url = "\(base)blogs"
            return try await session.request(url, parameters: params)
                .serializingDecodable(PagedResponse<BlogDTO>.self)
                .value
        }
}
