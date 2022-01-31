//
//  ContributorsPresenter.swift
//  GitHub Repos
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import Foundation

protocol ContributorsPresentable {
    var view: ContributorsShowable? { get set }
    
    func present(data: [Contributor])
}

final class ContributorsPresenter: ContributorsPresentable {
    
    // MARK: - Presentable -
    
    var view: ContributorsShowable?
    
    func present(data: [Contributor]) {
        view?.storage.contributors = data
        // Set the view state
        view?.storage.viewState = .success
    }
}
