//
//  RepositoriesInteractorTest.swift
//  GitHub ReposTests
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import XCTest
@testable import GitHub_Repos

class ContributorsInteractorTest: XCTestCase {

    var subject: ContributorsInteractor!
    var worker: MockContributorsWorker!
    var presenter: MockContributorsPresenter!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.subject = ContributorsInteractor()
        self.presenter = MockContributorsPresenter()
        self.worker = MockContributorsWorker()
        
        subject.worker = worker
        subject.presenter = presenter
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        subject = nil
        presenter = nil
        worker = nil
    }

    func testFetch_Succeeds() async throws {
        // Given
        let owner: String = "Someone"
        let repo: String = "Repo"
        // When
        try await subject.fetch(owner: owner, repo: repo)
        // Then
        XCTAssertEqual(presenter.contributors, MockModels.contributors)
    }

    func testFetch_Fails() async throws {
        // Given
        let owner: String = "Someone"
        let repo: String = "Repo"
        worker.error = .decodeError
        // When
        do {
            try await subject.fetch(owner: owner, repo: repo)
            XCTFail("Function didn't throw error as expected")
        }
        catch {
            XCTAssertEqual(error as? ContributorsWorker.Error, .decodeError)
        }
    }
    
    func testFetch_NilWorker() async throws {
        // Given
        let owner: String = "Someone"
        let repo: String = "Repo"
        subject.worker = nil
        // When
        do {
            try await subject.fetch(owner: owner, repo: repo)
            XCTFail("Function didn't throw error as expected")
        }
        // Then
        catch {
            XCTAssertEqual(error as? ContributorsInteractor.Error, .workerError)
        }
    }
}
