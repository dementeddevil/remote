//
//  OperationProtocol.swift
//  Remote
//
//  Created by Dmitry Klimkin on 22/8/17.
//  Copyright © 2017 Dev4Jam. All rights reserved.
//

import Foundation

/// Operation Protocol
public protocol OperationProtocol {
    associatedtype T

    /// Request
    var request: RequestProtocol? { get set }

    /// Execute an operation into specified service
    ///
    /// - Parameters:
    ///   - service: service to use
    /// - Returns: Promise
    func execute(in service: ServiceProtocol) async throws -> T

}

