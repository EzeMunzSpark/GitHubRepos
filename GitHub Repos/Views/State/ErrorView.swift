//
//  ErrorView.swift
//  GitHub Repos
//
//  Created by Ezequiel Facundo Munz on 25/01/2022.
//

import SwiftUI

struct ErrorView: View {
    // The retry handler for the button
    var retryHandler: () -> Void
    
    var body: some View {
        VStack {
            Text("Oops!")
                .font(.headline)
            
            Text("There's been an error processing your request")
                .font(.body)
            
            Button("Retry", action: retryHandler)
                .padding()
                .background(.green)
                .cornerRadius(8.0)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView { print("Tapped") } 
    }
}
