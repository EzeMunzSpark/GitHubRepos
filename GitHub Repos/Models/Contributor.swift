//
//  Contributor.swift
//  GitHub Repos
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import Foundation

// MARK: - Response -

typealias ContributorsResponse = [Contributor]

// MARK: - Model -

struct Contributor: Identifiable {
    let id: Int64
    let name: String
    let avatarUrl: String
    let contributions: Int
    let isAdmin: Bool
}

extension Contributor: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name = "login"
        case avatarUrl = "avatar_url"
        case contributions
        case isAdmin = "site_admin"
    }
}

extension Contributor: Equatable {}
