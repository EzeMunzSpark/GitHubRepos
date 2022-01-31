//
//  RepositoriesRouter.swift
//  GitHub Repos
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import SwiftUI

protocol RepositoriesRoutable {
    // Setup Destination View here
    typealias Destination = ContributorsView
    
    var navigationMode: NavigationMode { get }
    
    func route(forOwner owner: String, repo: String) -> Destination
}

final class RepositoriesRouter: RepositoriesRoutable {
    
    // MARK: - Routable -
    
    var navigationMode: NavigationMode {
        return .push
    }
    
    func route(forOwner owner: String, repo: String) -> Destination {
        let configurator: ContributorsConfigurator = ContributorsConfigurator(owner: owner, repo: repo)
        
        guard let destination = configurator.getView() as? Destination else {
            fatalError("Unable to create destination. Type mismatch")
        }
        
        return destination
    }
}
