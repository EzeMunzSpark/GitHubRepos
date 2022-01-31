//
//  ContributorsWorker.swift
//  GitHub Repos
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import Foundation

protocol ContributorsWorkable {
    func fetchContributors(owner: String, repo: String) async throws -> ContributorsResponse
}

actor ContributorsWorker: ContributorsWorkable {
    
    enum Error: Swift.Error {
        case decodeError
    }
    
    let networkEngine: NetworkEngine
    
    init(networkEngine: NetworkEngine) {
        self.networkEngine = networkEngine
    }
    
    // MARK: - Workable -
    
    func fetchContributors(owner: String, repo: String) async throws -> ContributorsResponse {
        let data = try await networkEngine.performRequest(api: .contributors(owner: owner, repo: repo))
        
        do {
            let response: ContributorsResponse = try JSONDecoder().decode(ContributorsResponse.self, from: data)
            
            return response
        }
        catch { throw Error.decodeError }
    }
}
