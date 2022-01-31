//
//  MockModels.swift
//  GitHub ReposTests
//
//  Created by Ezequiel Munz on 31/01/2022.
//

import Foundation
@testable import GitHub_Repos

struct MockModels {
    static let owner: Owner = Owner(id: 1234, name: "EzequielMunz", avatarUrl: "https://avatar.url")
    
    static let repository1: Repository = Repository(id: 1234,
                                                    name: "EzequielMunz",
                                                    fullName: "EzequielMunz/GitHubRepos",
                                                    url: "https://github.com/EzequielMunz/GitHubRepos",
                                                    watchers: 12345,
                                                    owner: owner)
    static let repository2: Repository = Repository(id: 1235,
                                                    name: "EzequielMunz",
                                                    fullName: "EzequielMunz/GitHubRepos2",
                                                    url: "https://github.com/EzequielMunz/GitHubRepos2",
                                                    watchers: 54321,
                                                    owner: owner)
    static let repository3: Repository = Repository(id: 1236,
                                                    name: "EzequielMunz",
                                                    fullName: "EzequielMunz/GitHubRepos3",
                                                    url: "https://github.com/EzequielMunz/GitHubRepos3",
                                                    watchers: 12345,
                                                    owner: owner)
    static let repository4: Repository = Repository(id: 1237,
                                                    name: "EzequielMunz",
                                                    fullName: "EzequielMunz/GitHubRepos4",
                                                    url: "https://github.com/EzequielMunz/GitHubRepos4",
                                                    watchers: 54321,
                                                    owner: owner)
    static let repository5: Repository = Repository(id: 1238,
                                                    name: "EzequielMunz",
                                                    fullName: "EzequielMunz/GitHubRepos5",
                                                    url: "https://github.com/EzequielMunz/GitHubRepos5",
                                                    watchers: 12345,
                                                    owner: owner)
    static let repository6: Repository = Repository(id: 1239,
                                                    name: "EzequielMunz",
                                                    fullName: "EzequielMunz/GitHubRepos6",
                                                    url: "https://github.com/EzequielMunz/GitHubRepos6",
                                                    watchers: 54321,
                                                    owner: owner)
    static let repository7: Repository = Repository(id: 1240,
                                                    name: "EzequielMunz",
                                                    fullName: "EzequielMunz/GitHubRepos7",
                                                    url: "https://github.com/EzequielMunz/GitHubRepos7",
                                                    watchers: 12345,
                                                    owner: owner)
    static let repository8: Repository = Repository(id: 1241,
                                                    name: "EzequielMunz",
                                                    fullName: "EzequielMunz/GitHubRepos8",
                                                    url: "https://github.com/EzequielMunz/GitHubRepos8",
                                                    watchers: 54321,
                                                    owner: owner)
    
    static let contributor1: Contributor = Contributor(id: 1234,
                                                       name: "EzequielMunz",
                                                       avatarUrl: "https://avatar.url",
                                                       contributions: 5000,
                                                       isAdmin: true)
    static let contributor2: Contributor = Contributor(id: 4321,
                                                       name: "SteveJobs",
                                                       avatarUrl: "https://avatar.url",
                                                       contributions: 2500,
                                                       isAdmin: false)
    
    static let repos: [Repository] = [repository1, repository2, repository3, repository4, repository5, repository6, repository7, repository8]
    
    static let contributors: [Contributor] = [contributor1, contributor2]
    
    static let reposResponse: RepositoriesResponse = RepositoriesResponse(items: repos)
    
    static let contributorsResponse: ContributorsResponse = contributors
}
