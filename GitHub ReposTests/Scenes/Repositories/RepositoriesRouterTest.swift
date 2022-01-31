//
//  RepositoriesRouterTest.swift
//  GitHub ReposTests
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import XCTest
@testable import GitHub_Repos

class RepositoriesRouterTest: XCTestCase {
    
    var subject: RepositoriesRouter!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        subject = RepositoriesRouter()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        subject = nil
    }
    
    func testNavigationMode() throws {
        // When
        let result = subject.navigationMode
        // Then
        XCTAssertEqual(result, .push)
    }

    func testRoute_CorrectDestination() throws {
        // Given
        let owner: String = "Someone"
        let repo: String = "Repo"
        // When
        let result = subject.route(forOwner: owner, repo: repo)
        // Then
        XCTAssertTrue(type(of: result) == ContributorsView.self)
        XCTAssertEqual("Someone", result.storage.owner)
        XCTAssertEqual("Repo", result.storage.repo)
    }
}
