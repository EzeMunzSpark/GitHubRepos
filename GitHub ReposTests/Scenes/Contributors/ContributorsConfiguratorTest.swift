//
//  RepositoriesConfiguratorTest.swift
//  GitHub ReposTests
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import Foundation
@testable import GitHub_Repos
import XCTest

final class ContributorsConfiguratorTest: XCTestCase {
    
    var subject: ContributorsConfigurator!
    
    override func setUp() {
        super.setUp()
        
        self.subject = ContributorsConfigurator(owner: "Someone", repo: "Repo")
    }
    
    override func tearDown() {
        self.subject = nil
        
        super.tearDown()
    }
    
    func testGetView() throws {
        // When
        let result = subject.getView()
        // Then
        XCTAssert(type(of: result) == ContributorsView.self)
    }
}
