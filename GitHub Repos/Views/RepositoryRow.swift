//
//  SwiftUIView.swift
//  GitHub Repos
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import SwiftUI

struct RepositoryRow: View {
    let repository: Repository
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: repository.owner.avatarUrl))
                .padding()
                .frame(width: 80, height: 60, alignment: .center)
                .aspectRatio(contentMode: .fit)
                .clipped()
            
            VStack(alignment: .leading) {
                Text(repository.name)
                    .font(.headline)
                    .bold()
                    .padding(.horizontal)
                
                Text(repository.fullName)
                    .font(.headline)
                    .foregroundColor(.gray)
                    .bold()
                    .padding(.horizontal)
                
                Text(repository.url)
                    .font(.footnote)
                    .foregroundColor(.blue)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.leading)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        let repo = Repository(id: 1234,
                              name: "SomeRepo",
                              fullName: "EzequielMunz/SomeRepo",
                              url: "https://github.com/EzequielMunz/SomeRepo",
                              watchers: 45000,
                              owner: Owner(id: 1234,
                                           name: "EzequielMunz",
                                           avatarUrl: ""))
        
        RepositoryRow(repository: repo)
            .previewLayout(.fixed(width: 475, height: 90))
    }
}
