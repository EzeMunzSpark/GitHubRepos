//
//  ContributorsView.swift
//  GitHub Repos
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import SwiftUI

protocol ContributorsConfigurable {
    var interactor: ContributorsInteractable { get }
    var router: ContributorsRoutable { get }
}

protocol ContributorsShowable {
    var storage: ContributorsStorage { get set }
}

class ContributorsStorage: ObservableObject {
    @Published var contributors: [Contributor] = []
    
    // MARK: - Parameters -
    var owner: String = ""
    var repo: String = ""
    
    // MARK: - View State -
    @Published var viewState: ViewState = .initialized
}

struct ContributorsView: View, ContributorsConfigurable, ContributorsShowable {
    
    // MARK: - Configurable -
    
    var interactor: ContributorsInteractable
    var router: ContributorsRoutable
    
    // MARK: - Showable -
    
    @ObservedObject var storage: ContributorsStorage = ContributorsStorage()
    
    // MARK: - View -
    
    var body: some View {
        switch storage.viewState {
        case .initialized:
            Rectangle()
                .fill(.white)
                .onAppear { self.fetch() }
        case .loading:
            LoadingView()
        case .success:
            createContent()
                .navigationTitle("Contributors")
        case .error:
            ErrorView() { self.fetch() }
        }
    }
    
    // MARK: - Public Functions -
    
    public func configureParameters(owner: String, repo: String) {
        self.storage.owner = owner
        self.storage.repo = repo
    }
    
    // MARK: - Private Functions -
    
    private func fetch() {
        Task {
            do {
                self.storage.viewState = .loading
                try await interactor.fetch(owner: self.storage.owner, repo: self.storage.repo)
            } catch {
                self.storage.viewState = .error
            }
        }
    }
    
    @ViewBuilder
    private func createContent() -> some View {
        List {
            ForEach(storage.contributors) { contributor in
                ContributorRow(contributor: contributor)
                    .padding()
            }
        }
    }
}

struct ContributorsView_Previews: PreviewProvider {
    static var previews: some View {
        ContributorsView(interactor: ContributorsInteractor(), router: ContributorsRouter())
    }
}
