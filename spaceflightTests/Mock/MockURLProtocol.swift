//
//  MockURLProtocol.swift
//  spaceflightTests
//
//  Created by Antonius Krisna Sahadewa on 09/11/25.
//

import XCTest
import Alamofire
@testable import spaceflight

final class MockURLProtocol: URLProtocol {
    static var testData: Data?

    override class func canInit(with request: URLRequest) -> Bool { true }
    override class func canonicalRequest(for request: URLRequest) -> URLRequest { request }

    override func startLoading() {
        if let d = MockURLProtocol.testData {
            self.client?.urlProtocol(self, didLoad: d)
        }
        self.client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() {}
}
