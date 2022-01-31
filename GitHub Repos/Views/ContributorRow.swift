//
//  ContributorRow.swift
//  GitHub Repos
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import SwiftUI

struct ContributorRow: View {
    let contributor: Contributor
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: contributor.avatarUrl))
                .padding()
                .frame(width: 80, height: 60, alignment: .center)
                .aspectRatio(contentMode: .fit)
                .clipped()
            
            VStack(alignment: .leading) {
                Text(contributor.name)
                    .font(.headline)
                    .bold()
                    .padding(.horizontal)
                
                HStack {
                    Text("Contributions: ")
                        .font(.body)
                    
                    Text("\(contributor.contributions)")
                        .font(.body)
                        .foregroundColor(.green)
                        .bold()
                }
                .padding(.horizontal)
                
                Text(contributor.isAdmin ? "Admin" : "")
                    .font(.body)
                    .bold()
                    .foregroundColor(.red)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.leading)
        }
    }
}

struct ContributorRow_Previews: PreviewProvider {
    static var previews: some View {
        let contributor: Contributor = Contributor(id: 1234,
                                                   name: "EzequielMunz",
                                                   avatarUrl: "",
                                                   contributions: 5492,
                                                   isAdmin: true)
        ContributorRow(contributor: contributor)
            .previewLayout(.fixed(width: 475, height: 90))
    }
}
