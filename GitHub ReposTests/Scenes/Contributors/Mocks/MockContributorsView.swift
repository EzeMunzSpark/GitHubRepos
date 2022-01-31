//
//  MockRepositoriesView.swift
//  GitHub ReposTests
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import Foundation
@testable import GitHub_Repos

final class MockContributorsView: ContributorsShowable {
    var storage: ContributorsStorage = ContributorsStorage()
    
    var contributors: [Contributor] {
        storage.contributors
    }
}
