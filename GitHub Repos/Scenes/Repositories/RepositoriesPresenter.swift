//
//  RepositoriesPresenter.swift
//  GitHub Repos
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import Foundation

protocol RepositoriesPresentable {
    var view: RepositoriesShowable? { get set }
    
    func present(data: RepositoriesResponse)
}

final class RepositoriesPresenter: RepositoriesPresentable {
    
    // MARK: - Presentable -
    
    var view: RepositoriesShowable?
    
    func present(data: RepositoriesResponse) {
        // Set the top 5
        view?.storage.topRepos = Array(data.items.prefix(5))
        // Set the remaining repos
        view?.storage.repositories = Array(data.items.dropFirst(5))
        // Change the view state
        view?.storage.viewState = .success
    }
}
