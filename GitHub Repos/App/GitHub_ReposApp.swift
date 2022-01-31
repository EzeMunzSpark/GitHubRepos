//
//  GitHub_ReposApp.swift
//  GitHub Repos
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import SwiftUI
import Resolver

@main
struct GitHub_ReposApp: App {
    // The repositories scene configurator
    let repositoriesSceneConfigurator: RepositoriesConfigurator
    
    init() {
        // Register the dependencies
        Self.registerDependencies()
        
        self.repositoriesSceneConfigurator = RepositoriesConfigurator()
    }
    
    var body: some Scene {
        WindowGroup {
            self.repositoriesSceneConfigurator.getView()
        }
    }
    
    // MARK: - Private -
    
    private static func registerDependencies() {
        // Networking
        Resolver.register { DefaultNetworkEngine() as NetworkEngine }
    }
}
