//
//  ViewState.swift
//  GitHub Repos
//
//  Created by Ezequiel Facundo Munz on 25/01/2022.
//

import SwiftUI

/// Defines the different possible states for the views based on content,
/// server response loading and error states
enum ViewState {
    case initialized
    case loading
    case success
    case error
}

protocol ViewStateProtocol where Self: View {
    var viewState: ViewState { get set }
}
