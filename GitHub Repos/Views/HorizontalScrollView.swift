//
//  HorizontalScrollView.swift
//  GitHub Repos
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import SwiftUI

struct HorizontalScrollView<Content: View>: View {
    let itemCount: Int
    let content: (_ index: Int) -> Content
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<itemCount) { index in
                    content(index)
                        .padding()
                }
            }
        }
    }
}

struct HorizontalScrollView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalScrollView(itemCount: 5) { index in
            ZStack {
                Rectangle()
                    .frame(width: 100, height: 100, alignment: .center)
                
                Text("\(index)")
                    .font(.title)
                    .bold()
            }
        }
    }
}
