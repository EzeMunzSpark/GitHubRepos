//
//  RepositoriesInteractorTest.swift
//  GitHub ReposTests
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import XCTest
@testable import GitHub_Repos

class RepositoriesInteractorTest: XCTestCase {

    var subject: RepositoriesInteractor!
    var worker: MockRepositoriesWorker!
    var presenter: MockRepositoriesPresenter!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.subject = RepositoriesInteractor()
        self.presenter = MockRepositoriesPresenter()
        self.worker = MockRepositoriesWorker()
        
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
        // When
        try await subject.fetch()
        // Then
        XCTAssertEqual(presenter.topRepos, [MockModels.repository1, MockModels.repository2, MockModels.repository3, MockModels.repository4, MockModels.repository5])
        XCTAssertEqual(presenter.repos, [MockModels.repository6, MockModels.repository7, MockModels.repository8])
    }

    func testFetch_Fails() async throws {
        // Given
        worker.error = .decodeError
        // When
        do {
            try await subject.fetch()
            XCTFail("Function didn't throw error as expected")
        }
        catch {
            XCTAssertEqual(error as? RepositoriesWorker.Error, .decodeError)
        }
    }
    
    func testFetch_NilWorker() async throws {
        // Given
        subject.worker = nil
        // When
        do {
            try await subject.fetch()
            XCTFail("Function didn't throw error as expected")
        }
        // Then
        catch {
            XCTAssertEqual(error as? RepositoriesInteractor.Error, .workerError)
        }
    }
}
