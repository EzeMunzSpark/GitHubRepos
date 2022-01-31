//
//  API.swift
//  API
//
//  Created by Ezequiel Munz on 19/08/2021.
//

import Foundation

enum API {
    /// The OAuth2 access token
    var accessToken: String {
        /// Provide your access token here
        return ""
    }
    
    case repositories
    case contributors(owner: String, repo: String)
    
    // MARK: - Public
    
    var request: URLRequest {
        var request: URLRequest = URLRequest(url: url)
        
        switch self {
        case .repositories, .contributors:
            request.httpMethod = "GET"
            request.setValue(accessToken, forHTTPHeaderField: "access-token")
        }
        
        return request
    }
    
    var url: URL {
        if let url = urlComponents.url {
            return url
        }
        fatalError("Couldn't create the URL for the given API")
    }
    
    // MARK: - Private
    
    private var host: String {
        switch self {
        case .repositories, .contributors:
            return "api.github.com"
        }
    }
    
    private var path: String {
        switch self {
        case .repositories:
            return "/search/repositories"
        case .contributors(let owner, let repo):
            return "/repos/\(owner)/\(repo)/contributors"
        }
    }
    
    private var parameters: [String: String] {
        switch self {
        case .repositories:
            return ["q": "stars:>0"]
        case .contributors:
            return [:]
        }
    }
    
    private var urlComponents: URLComponents {
        var components: URLComponents = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path
        components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        return components
    }
}
