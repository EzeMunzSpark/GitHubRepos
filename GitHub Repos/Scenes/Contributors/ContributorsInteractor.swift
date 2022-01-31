//
//  ContributorsInteractor.swift
//  GitHub Repos
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import Foundation

protocol ContributorsInteractable {
    var presenter: ContributorsPresentable? { get set }
    var worker: ContributorsWorkable? { get set }
    
    func fetch(owner: String, repo: String) async throws
}

final class ContributorsInteractor: ContributorsInteractable {
    
    // MARK: - Error -
    
    enum Error: Swift.Error {
        case workerError
        
        var description: String {
            switch self {
            case .workerError:
                return "There's been a problem with the request. Try again later"
            }
        }
    }
    
    // MARK: - Interactable -
    
    var presenter: ContributorsPresentable?
    var worker: ContributorsWorkable?
    
    @MainActor
    func fetch(owner: String, repo: String) async throws {
        guard let response = try await worker?.fetchContributors(owner: owner, repo: repo) else { throw Error.workerError }
        
        presenter?.present(data: response)
    }
}
