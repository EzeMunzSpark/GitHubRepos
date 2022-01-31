//
//  RepositoriesWorkerTest.swift
//  GitHub ReposTests
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import XCTest
@testable import GitHub_Repos

class ContributorsWorkerTest: XCTestCase {

    var subject: ContributorsWorker!
    var networkEngine: MockNetworkEngine!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        networkEngine = MockNetworkEngine()
        subject = ContributorsWorker(networkEngine: networkEngine)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        networkEngine = nil
        subject = nil
    }

    func testFetchContributors_Succeeds() async throws {
        // Given
        let owner: String = "Someone"
        let repo: String = "Repo"
        networkEngine.stubResponse(response: MockModels.contributors,
                                   for: .contributors(owner: owner, repo: repo))
        // When
        let response = try await subject.fetchContributors(owner: owner, repo: repo)
        // Then
        XCTAssertEqual(response, MockModels.contributors)
    }

    func testFetchContributors_NetworkError() async throws {
        // Given
        let owner: String = "Someone"
        let repo: String = "Repo"
        networkEngine.error = NetworkError.invalidStatusCode
        // When
        do {
            let _ = try await subject.fetchContributors(owner: owner, repo: repo)
            XCTFail("Function didn't throw error as expected")
        }
        // Then
        catch {
            XCTAssertEqual(error as? NetworkError, .invalidStatusCode)
        }
    }
    
    func testFetchContributors_DecodeError() async throws {
        // Given
        let owner: String = "Someone"
        let repo: String = "Repo"
        networkEngine.stubEmptyResponse(for: .contributors(owner: owner, repo: repo))
        // When
        do {
            let _ = try await subject.fetchContributors(owner: owner, repo: repo)
            XCTFail("Function didn't throw error as expected")
        }
        // Then
        catch {
            XCTAssertEqual(error as? ContributorsWorker.Error, .decodeError)
        }
    }
}
