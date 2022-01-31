//
//  NetworkEngine.swift
//  NetworkEngine
//
//  Created by Ezequiel Munz on 19/08/2021.
//

import Foundation

enum NetworkError: Swift.Error {
    case invalidStatusCode
}

protocol NetworkEngine {
    func performRequest(api: API) async throws -> Data
}

final class DefaultNetworkEngine: NetworkEngine {
    
    func performRequest(api: API) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(for: api.request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { throw NetworkError.invalidStatusCode }
        
        return data
    }
}
