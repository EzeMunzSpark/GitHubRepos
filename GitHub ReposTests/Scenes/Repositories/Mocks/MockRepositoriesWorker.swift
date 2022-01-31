//
//  MockRepositoriesWorker.swift
//  GitHub ReposTests
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import Foundation
@testable import GitHub_Repos

final class MockRepositoriesWorker: RepositoriesWorkable {
    var error: RepositoriesWorker.Error?
    
    func fetchRepositories() async throws -> RepositoriesResponse {
        if let error = error {
            throw error
        }
        
        return MockModels.reposResponse
    }
}
