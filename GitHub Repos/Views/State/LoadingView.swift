//
//  LoadingView.swift
//  GitHub Repos
//
//  Created by Ezequiel Facundo Munz on 25/01/2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8.0)
                .fill(.white)
                .shadow(radius: 6.0)
            
            VStack {
                Text("Loading...")
                    .font(.caption)
                    .bold()
                    .foregroundColor(.gray)
                
                ProgressView()
            }
        }
        .frame(width: 100, height: 100, alignment: .center)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
