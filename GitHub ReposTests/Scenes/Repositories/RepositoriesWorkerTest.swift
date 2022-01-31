//
//  RepositoriesWorkerTest.swift
//  GitHub ReposTests
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import XCTest
@testable import GitHub_Repos

class RepositoriesWorkerTest: XCTestCase {

    var subject: RepositoriesWorker!
    var networkEngine: MockNetworkEngine!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        networkEngine = MockNetworkEngine()
        subject = RepositoriesWorker(networkEngine: networkEngine)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        networkEngine = nil
        subject = nil
    }

    func testFetchRepositories_Succeeds() async throws {
        // Given
        networkEngine.stubResponse(response: MockModels.reposResponse, for: .repositories)
        // When
        let response = try await subject.fetchRepositories()
        // Then
        XCTAssertEqual(response.items, MockModels.repos)
    }

    func testFetchRepositories_NetworkError() async throws {
        // Given
        networkEngine.error = NetworkError.invalidStatusCode
        // When
        do {
            let _ = try await subject.fetchRepositories()
            XCTFail("Function didn't throw error as expected")
        }
        // Then
        catch {
            XCTAssertEqual(error as? NetworkError, .invalidStatusCode)
        }
    }
    
    func testFetchRepositories_DecodeError() async throws {
        // Given
        networkEngine.stubEmptyResponse(for: .repositories)
        // When
        do {
            let _ = try await subject.fetchRepositories()
            XCTFail("Function didn't throw error as expected")
        }
        // Then
        catch {
            XCTAssertEqual(error as? RepositoriesWorker.Error, .decodeError)
        }
    }
}
