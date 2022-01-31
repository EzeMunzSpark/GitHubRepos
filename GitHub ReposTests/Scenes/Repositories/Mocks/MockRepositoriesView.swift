//
//  MockRepositoriesView.swift
//  GitHub ReposTests
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import Foundation
@testable import GitHub_Repos

final class MockRepositoriesView: RepositoriesShowable {
    var storage: RepositoriesStorage = RepositoriesStorage()
    
    var topRepos: [Repository] {
        storage.topRepos
    }
    
    var repos: [Repository] {
        storage.repositories
    }
}
