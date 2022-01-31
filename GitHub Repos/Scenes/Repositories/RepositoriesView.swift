//
//  RepositoriesView.swift
//  GitHub Repos
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import SwiftUI

protocol RepositoriesConfigurable {
    var interactor: RepositoriesInteractable { get }
    var router: RepositoriesRoutable { get }
}

protocol RepositoriesShowable {
    var storage: RepositoriesStorage { get set }
}

class RepositoriesStorage: ObservableObject {
    
    @Published var topRepos: [Repository] = []
    @Published var repositories: [Repository] = []
    
    // MARK: - View State -
    
    @Published var viewState: ViewState = .initialized
}

struct RepositoriesView: View, RepositoriesConfigurable, RepositoriesShowable {
    
    // MARK: - Configurable -
    
    var interactor: RepositoriesInteractable
    var router: RepositoriesRoutable
    
    // MARK: - Showable -
    
    @ObservedObject var storage: RepositoriesStorage = RepositoriesStorage()
    
    // MARK: - View -
    
    var body: some View {
        NavigationView {
            switch storage.viewState {
            case .initialized:
                Rectangle()
                    .fill(.white)
                    .onAppear { self.fetch() }
            case .loading:
                LoadingView()
            case .success:
                createContent()
                    .navigationTitle("GitHub Repositories")
            case .error:
                ErrorView() { self.fetch() }
            }
        }
    }
    
    // MARK: - Private Functions -
    
    private func fetch() {
        Task {
            do {
                self.storage.viewState = .loading
                try await interactor.fetch()
            } catch {
                self.storage.viewState = .error
            }
        }
    }
    
    @ViewBuilder
    private func createContent() -> some View {
        List {
            Section("Top \(storage.topRepos.count)") {
                HorizontalScrollView(itemCount: storage.topRepos.count) { index in
                    NavigableView(mode: router.navigationMode,
                                  destination: router.route(forOwner: storage.topRepos[index].owner.name,
                                                            repo: storage.topRepos[index].name)) {
                        TopRepoView(repository: storage.topRepos[index])
                            .frame(width: 250, height: 300, alignment: .center)
                    }
                }
            }
            
            Section("Repositories") {
                ForEach(storage.repositories) { repo in
                    NavigableView(mode: router.navigationMode,
                                  destination: router.route(forOwner: repo.owner.name, repo: repo.name)) {
                        RepositoryRow(repository: repo)
                            .frame(height: 90, alignment: .center)
                    }
                }
            }
        }
    }
}

struct RepositoriesView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoriesView(interactor: RepositoriesInteractor(), router: RepositoriesRouter())
    }
}
