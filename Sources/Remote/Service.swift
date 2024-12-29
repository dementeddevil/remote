//
//  Service.swift
//  Remote
//
//  Created by Dmitry Klimkin on 22/8/17.
//  Copyright © 2017 Dev4Jam. All rights reserved.
//

import Foundation

/// Service is a concrete implementation of the ServiceProtocol
open class Service: NSObject, ServiceProtocol {

    /// Configuration
    public let configuration: ServiceConfig

    /// Session headers
    public var headers: HeadersDictionary

    /// URL session
    public let session: URLSessionProtocol

    /// Internal processing queue
    private let networkingQueue = DispatchQueue(label: "network-processing-queue")

    /// Initialize a new service with given configuration
    ///
    /// - Parameter configuration: configuration. If `nil` is passed attempt to load configuration from your app's Info.plist
    public required init(_ configuration: ServiceConfig, session: URLSessionProtocol) {
        self.configuration = configuration
        self.headers = self.configuration.headers // fillup with initial headers
        self.session = session
    }

    /// Execute a request and return a promise with the response
    ///
    /// - Parameters:
    ///   - request: request to execute
    ///   - retry: retry attempts. If `nil` only one attempt is made. Default value is `nil`.
    /// - Returns: Promise
    /// - Throws: throw an exception if operation cannot be executed
    public func execute(_ request: RequestProtocol?, cacheKey: String?) async throws -> ResponseProtocol {

        guard let rq = request else { // missing request
            throw NetworkError.missingEndpoint("no request specified")
        }

        do {
            let urlRequest = try rq.urlRequest(in: self)

            let (data, response) = try await self.session.create(for: urlRequest)
            let parsedResponse = Response(urlResponse: response, data: data, request: rq)

            switch parsedResponse.type {
                case .success: // success
                    return parsedResponse
                case .error(let code): // failure
                    if code == 23 {
                        throw NetworkError.authorisationExpired("session expired")
                    } else if code == 401 {
                        throw NetworkError.notAuthorised("request is not authorized")
                    } else if parsedResponse.data != nil {
                        return parsedResponse
                    } else {
                        throw NetworkError.genericError("received error code: \(code)")
                    }
                case .noResponse:  // no response
                    throw NetworkError.noResponse("no response from server")
            }
        }
    }

    /// Updates existing ssl pinning credential
    ///
    /// - Parameter credential: credential to set
    public func updateCredential(to credential: URLCredential) {
        guard let host = configuration.url.host else { return }

        var port = 443

        if let configPort = configuration.url.port  {
            port = configPort
        }

        session.updateCredential(to: credential, for: host, port: port)
    }
}
