//
//  NavigableView.swift
//  NavigableView
//
//  Created by Ezequiel Munz on 17/09/2021.
//

import SwiftUI

/// The navigation mode for the view.
enum NavigationMode {
    case push
    case present
}

/// View that abstracts the navigation type
struct NavigableView<Content: View, Destination: View>: View {
    
    let mode: NavigationMode
    let destination: Destination
    let content: Content
    
    init(mode: NavigationMode, destination: Destination, @ViewBuilder content: () -> Content) {
        self.mode = mode
        self.destination = destination
        self.content = content()
    }
    
    @State var presented: Bool = false
    
    var body: some View {
        switch mode {
        case .push:
            NavigationLink(destination: destination) {
                content
            }
        case .present:
            content
                .onTapGesture {
                    presented = true
                }
                .sheet(isPresented: $presented) {
                    destination
                }
        }
    }
}
