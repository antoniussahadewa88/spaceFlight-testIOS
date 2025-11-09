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

    // You can add fetchBlogs / fetchReports similarly by changing endpoint
}
