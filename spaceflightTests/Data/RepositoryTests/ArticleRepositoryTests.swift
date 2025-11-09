//
//  ArticleRepositoryTests.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 08/11/25.
//

import XCTest
import Alamofire
@testable import spaceflight

final class ArticleRepositoryTests: XCTestCase {
    func testFetchArticles_parsesCorrectly() async throws {
        // prepare fake JSON
        let json = """
        {
          "count": 1,
          "results": [
            {
              "id": 1,
              "title": "Test Article",
              "url": "https://x",
              "imageUrl": null,
              "newsSite": "TestSite",
              "summary": "Hello.",
              "publishedAt": "2024-04-16T16:00:00Z",
              "launches": [],
              "events": []
            }
          ]
        }
        """.data(using: .utf8)!

        MockURLProtocol.testData = json

        // inject mock protocol into Alamofire Session
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]

        let alamofireSession = Alamofire.Session(configuration: config)
        let api = SpaceFlightAPI(session: alamofireSession)

        // Act
        let page = try await api.fetchArticles(limit: 10)

        // Assert
        XCTAssertEqual(page.count, 1)
        XCTAssertEqual(page.results.first?.title, "Test Article")
    }
}
