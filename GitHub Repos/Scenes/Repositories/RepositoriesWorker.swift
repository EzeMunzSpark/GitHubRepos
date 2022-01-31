//
//  RepositoriesWorker.swift
//  GitHub Repos
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import Foundation
import Resolver

protocol RepositoriesWorkable {
    func fetchRepositories() async throws -> RepositoriesResponse
}

actor RepositoriesWorker: RepositoriesWorkable {
    
    enum Error: Swift.Error {
        case decodeError
    }
    
    let networkEngine: NetworkEngine
    
    init(networkEngine: NetworkEngine) {
        self.networkEngine = networkEngine
    }
    
    // MARK: - Workable -
    
    func fetchRepositories() async throws -> RepositoriesResponse {
        let data = try await networkEngine.performRequest(api: .repositories)
        
        do {
            let response: RepositoriesResponse = try JSONDecoder().decode(RepositoriesResponse.self, from: data)
            
            return response
        }
        catch { throw Error.decodeError }
    }
}
