//
//  MockNetworkEngine.swift
//  GitHub ReposTests
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import Foundation
@testable import GitHub_Repos

final class MockNetworkEngine: NetworkEngine {
    var performedRequests: [API] = []
    var lastPerformedRequestURL: String? = nil
    var responses: [String: Data] = [:]
    
    var error: NetworkError? = nil
    
    func performRequest(api: API) async throws -> Data {
        if let error = error {
            throw error
        }
        performedRequests.append(api)
        lastPerformedRequestURL = api.url.absoluteString
        return responses[api.url.absoluteString] ?? Data()
    }
    
    // MARK: - Mock
    
    func stubResponse<T: Codable>(response: T, for api: API) {
        guard let data = try? JSONEncoder().encode(response) else {
            fatalError("Could not encode the response value")
        }
        responses[api.url.absoluteString] = data
    }
    
    func stubEmptyResponse(for api: API) {
        responses[api.url.absoluteString] = Data()
    }
}
