//
//  RepositoriesInteractor.swift
//  GitHub Repos
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import Foundation

protocol RepositoriesInteractable {
    var presenter: RepositoriesPresentable? { get set }
    var worker: RepositoriesWorkable? { get set }
    
    func fetch() async throws
}

final class RepositoriesInteractor: RepositoriesInteractable {
    
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
    
    var presenter: RepositoriesPresentable?
    var worker: RepositoriesWorkable?
    
    @MainActor
    func fetch() async throws {
        guard let response = try await worker?.fetchRepositories() else { throw Error.workerError }
        
        presenter?.present(data: response)
    }
}
