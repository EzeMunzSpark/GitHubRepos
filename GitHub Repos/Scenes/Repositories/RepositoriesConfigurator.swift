//
//  RepositoriesConfigurator.swift
//  GitHub Repos
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import SwiftUI
import Resolver

final class RepositoriesConfigurator {
    private var configuration: Configuration
    
    init(using configuration: Configuration = .default) {
        self.configuration = configuration
        
        self.buildComponents()
    }
    
    // MARK: - Public -
    
    public func getView() -> some View {
        return configuration.view
    }
    
    // MARK: - Private -
    
    private func buildComponents() {
        self.configuration.interactor.worker = self.configuration.worker
        self.configuration.interactor.presenter = self.configuration.presenter
        
        self.configuration.presenter.view = self.configuration.view
    }
}

extension RepositoriesConfigurator {
    struct Configuration {
        var view: RepositoriesView
        var interactor: RepositoriesInteractable
        var presenter: RepositoriesPresentable
        var router: RepositoriesRoutable
        var worker: RepositoriesWorkable
        
        static var `default`: Configuration {
            // Dependencies
            let networkEngine: NetworkEngine = Resolver.resolve()
            // Scene components
            let interactor: RepositoriesInteractable = RepositoriesInteractor()
            let presenter: RepositoriesPresentable = RepositoriesPresenter()
            let router: RepositoriesRoutable = RepositoriesRouter()
            let worker: RepositoriesWorkable = RepositoriesWorker(networkEngine: networkEngine)
            // For SwiftUI Implementation
            // View is a struct so we need to inject on initializer
            let view: RepositoriesView = RepositoriesView(interactor: interactor, router: router)
            
            return Configuration(view: view,
                                 interactor: interactor,
                                 presenter: presenter,
                                 router: router,
                                 worker: worker)
        }
    }
}
