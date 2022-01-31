//
//  ContributorsConfigurator.swift
//  GitHub Repos
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import SwiftUI
import Resolver

final class ContributorsConfigurator {
    private var configuration: Configuration
    
    init(owner: String, repo: String, configuration: Configuration = .default) {
        self.configuration = configuration
        
        self.buildComponents(owner: owner, repo: repo)
    }
    
    // MARK: - Public -
    
    public func getView() -> some View {
        return configuration.view
    }
    
    // MARK: - Private -
    
    private func buildComponents(owner: String, repo: String) {
        self.configuration.view.configureParameters(owner: owner, repo: repo)
        
        self.configuration.interactor.worker = self.configuration.worker
        self.configuration.interactor.presenter = self.configuration.presenter
        
        self.configuration.presenter.view = self.configuration.view
    }
}

extension ContributorsConfigurator {
    struct Configuration {
        var view: ContributorsView
        var interactor: ContributorsInteractable
        var presenter: ContributorsPresentable
        var router: ContributorsRoutable
        var worker: ContributorsWorkable
        
        static var `default`: Configuration {
            // Dependencies
            let networkEngine: NetworkEngine = Resolver.resolve()
            // Scene components
            let interactor: ContributorsInteractable = ContributorsInteractor()
            let presenter: ContributorsPresentable = ContributorsPresenter()
            let router: ContributorsRoutable = ContributorsRouter()
            let worker: ContributorsWorkable = ContributorsWorker(networkEngine: networkEngine)
            // For SwiftUI Implementation
            // View is a struct so we need to inject on initializer
            let view: ContributorsView = ContributorsView(interactor: interactor, router: router)
            
            return Configuration(view: view,
                                 interactor: interactor,
                                 presenter: presenter,
                                 router: router,
                                 worker: worker)
        }
    }
}
