//
//  Owner.swift
//  GitHub Repos
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import Foundation

struct Owner {
    let id: Int64
    let name: String
    let avatarUrl: String
}

extension Owner: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name = "login"
        case avatarUrl = "avatar_url"
    }
}

extension Owner: Equatable {}
