//
//  APIClient.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 08/11/25.
//

import Foundation
import Alamofire
import Security
import Combine

final class APIClient {
    static let session: Session = {
        // Try to load cert from bundle "spaceflight_api.cer"
        if let certPath = Bundle.main.path(forResource: "spaceflight_api", ofType: "cer"),
           let certData = try? Data(contentsOf: URL(fileURLWithPath: certPath)),
           let cert = SecCertificateCreateWithData(nil, certData as CFData) {
            let evaluator = PinnedCertificatesTrustEvaluator(
                certificates: [cert],
                acceptSelfSignedCertificates: false,
                performDefaultValidation: true,
                validateHost: true
            )
            let stm = ServerTrustManager(evaluators: ["api.spaceflightnewsapi.net": evaluator])
            return Session(serverTrustManager: stm)
        } else {
            // fallback
            return Session.default
        }
    }()
}

