//
//  MockRepositoriesPresenter.swift
//  GitHub ReposTests
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import Foundation
@testable import GitHub_Repos

final class MockRepositoriesPresenter: RepositoriesPresentable {
    var view: RepositoriesShowable? = MockRepositoriesView()
    
    var topRepos: [Repository] = []
    var repos: [Repository] = []
    
    func present(data: RepositoriesResponse) {
        self.topRepos = Array(data.items.prefix(5))
        self.repos = Array(data.items.dropFirst(5))
    }
}
