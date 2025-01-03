//
//	Operations.swift
//  Remote
//
//  Created by Dmitry Klimkin on 22/8/17.
//  Copyright © 2017 Dev4Jam. All rights reserved.
//

import Foundation

/// Model Operation, return a response as Decodable Model
open class ModelOperation<Output: Decodable>: OperationProtocol {
    public typealias DataType = Output
    
    /// Request
    public var request: RequestProtocol?
    
    /// Init
    public init() { }
    
    /// Execute a request and return your specified model `Output`.
    ///
    /// - Parameters:
    ///   - service: service to use
    /// - Returns: Promise
    public func execute(in service: ServiceProtocol) async throws -> Output {
        let decoder = JSONDecoder()
        
        let response = try await service.execute(request, cacheKey: "")
        guard let data = response.data else {
            throw NetworkError.missingData("response with no data")
        }
        
        do {
            return try decoder.decode(Output.self, from: data)
        } catch let error {
            throw NetworkError.failedToDecode(error.localizedDescription)
        }
    }
}
