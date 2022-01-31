//
//  MockRepositoriesWorker.swift
//  GitHub ReposTests
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import Foundation
@testable import GitHub_Repos

final class MockContributorsWorker: ContributorsWorkable {
    var error: ContributorsWorker.Error?
    
    func fetchContributors(owner: String, repo: String) async throws -> ContributorsResponse {
        if let error = error {
            throw error
        }
        
        return MockModels.contributorsResponse
    }
}
