//
//  MockURLSession.swift
//  RemoteTests
//
//  Created by Dmitry Klimkin on 18/9/17.
//  Copyright © 2017 Dev4Jam. All rights reserved.
//

import Foundation

@testable import Remote

final class MockURLSession: URLSessionProtocol {
    func enableDebugMode() {

    }

    func updateCredential(to credential: URLCredential, for host: String, port: Int) {

    }

    func create(for request: URLRequest) async throws -> DataResult {

        let bundle = Bundle.module//(for: type(of: self))

        guard let path = bundle.path(forResource: "get", ofType: "json") else {
            throw NSError(domain: "Network error: Unable to find json file", code: 1000, userInfo: nil)
        }

        let url = URL(fileURLWithPath: path)
        let data = try Data(contentsOf: url, options: .alwaysMapped)
        let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: "2.0", headerFields: nil)

        return (data, response)
    }
}
