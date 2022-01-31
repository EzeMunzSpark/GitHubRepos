//
//  RepositoriesPresenterTest.swift
//  GitHub ReposTests
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import XCTest
@testable import GitHub_Repos

class RepositoriesPresenterTest: XCTestCase {

    var subject: RepositoriesPresenter!
    var view: MockRepositoriesView!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        subject = RepositoriesPresenter()
        view = MockRepositoriesView()
        
        subject.view = view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        subject = nil
        view = nil
    }

    func testPresentData_TopRepos() throws {
        // Given
        let response = MockModels.reposResponse
        // When
        subject.present(data: response)
        // Then
        XCTAssertEqual(view.topRepos.count, 5)
        XCTAssertTrue(view.topRepos.contains(MockModels.repository3))
        XCTAssertFalse(view.topRepos.contains(MockModels.repository8))
    }

    func testPresentData_Repos() throws {
        // Given
        let response = MockModels.reposResponse
        // When
        subject.present(data: response)
        // Then
        XCTAssertEqual(view.repos.count, 3)
        XCTAssertTrue(view.repos.contains(MockModels.repository8))
        XCTAssertFalse(view.repos.contains(MockModels.repository3))
    }
}
