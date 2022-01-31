//
//  TopRepoView.swift
//  GitHub Repos
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import SwiftUI

struct TopRepoView: View {
    let repository: Repository
    
    var body: some View {
        VStack {
            GeometryReader { proxy in
                AsyncImage(url: URL(string: repository.owner.avatarUrl))
                    .frame(width: proxy.size.width, height: proxy.size.height * 0.75)
                    .aspectRatio(contentMode: .fill)
                    .clipped()
            }
            
            Text(repository.name)
                .font(.title3)
                .bold()
            
            Text(repository.fullName)
                .font(.headline)
                .foregroundColor(.gray)
            
            HStack {
                Text("Watchers: ")
                    .font(.body)
                
                Text("\(repository.watchers)")
                    .font(.body)
                    .bold()
                    .foregroundColor(.green)
            }
            .padding(.horizontal)
        }
    }
}

struct TopRepoView_Previews: PreviewProvider {
    static var previews: some View {
        let repo = Repository(id: 1234,
                              name: "SomeRepo",
                              fullName: "EzequielMunz/SomeRepo",
                              url: "https://github.com/EzequielMunz/SomeRepo",
                              watchers: 45000,
                              owner: Owner(id: 1234,
                                           name: "EzequielMunz",
                                           avatarUrl: ""))
        TopRepoView(repository: repo)
            .previewLayout(.fixed(width: 250, height: 300))
    }
}
