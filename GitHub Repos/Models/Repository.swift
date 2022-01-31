//
//  Repository.swift
//  GitHub Repos
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import Foundation

// MARK: - Response -

struct RepositoriesResponse {
    let items: [Repository]
}

extension RepositoriesResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case items
    }
}

// MARK: - Model -

struct Repository: Identifiable {
    let id: Int64
    let name: String
    let fullName: String
    let url: String
    let watchers: Int
    let owner: Owner
}

extension Repository: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case url = "html_url"
        case watchers
        case owner
    }
}

extension Repository: Equatable {}
