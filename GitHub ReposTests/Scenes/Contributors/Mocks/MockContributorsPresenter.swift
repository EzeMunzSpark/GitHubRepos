//
//  MockRepositoriesPresenter.swift
//  GitHub ReposTests
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import Foundation
@testable import GitHub_Repos

final class MockContributorsPresenter: ContributorsPresentable {
    var view: ContributorsShowable? = MockContributorsView()
    
    var contributors: [Contributor] = []
    
    func present(data: ContributorsResponse) {
        self.contributors = data
    }
}
