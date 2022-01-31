//
//  RepositoriesPresenterTest.swift
//  GitHub ReposTests
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import XCTest
@testable import GitHub_Repos

class ContributorsPresenterTest: XCTestCase {

    var subject: ContributorsPresenter!
    var view: MockContributorsView!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        subject = ContributorsPresenter()
        view = MockContributorsView()
        
        subject.view = view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        subject = nil
        view = nil
    }

    func testPresentData() throws {
        // Given
        let response = MockModels.contributorsResponse
        // When
        subject.present(data: response)
        // Then
        XCTAssertEqual(view.contributors.count, 2)
        XCTAssertEqual(view.contributors, MockModels.contributors)
    }

}
