//
//  UserTests.swift
//  Sahha-IOSTests
//
//  Created by Rohit Kumar on 09/08/2024.
//

import XCTest
@testable import Sahha_IOS

class UserTests: XCTestCase {

    // Test case for correct parsing of JSON data
    func testUserParsingSuccess() {
        let json = """
        [
            {
                "login": "mojombo",
                "id": 1,
                "node_id": "MDQ6VXNlcjE=",
                "avatar_url": "https://avatars.githubusercontent.com/u/1?v=4",
                "gravatar_id": "",
                "url": "https://api.github.com/users/mojombo",
                "html_url": "https://github.com/mojombo",
                "followers_url": "https://api.github.com/users/mojombo/followers",
                "following_url": "https://api.github.com/users/mojombo/following{/other_user}",
                "gists_url": "https://api.github.com/users/mojombo/gists{/gist_id}",
                "starred_url": "https://api.github.com/users/mojombo/starred{/owner}{/repo}",
                "subscriptions_url": "https://api.github.com/users/mojombo/subscriptions",
                "organizations_url": "https://api.github.com/users/mojombo/orgs",
                "repos_url": "https://api.github.com/users/mojombo/repos",
                "events_url": "https://api.github.com/users/mojombo/events{/privacy}",
                "received_events_url": "https://api.github.com/users/mojombo/received_events",
                "type": "User",
                "site_admin": false
            }
        ]
        """.data(using: .utf8)!

        do {
            let users = try JSONDecoder().decode([UserModel].self, from: json)
            XCTAssertEqual(users.count, 1)
            let user = users.first
            XCTAssertEqual(user?.login, "mojombo")
            XCTAssertEqual(user?.id, 1)
            XCTAssertEqual(user?.node_id, "MDQ6VXNlcjE=")
            XCTAssertEqual(user?.avatar_url, "https://avatars.githubusercontent.com/u/1?v=4")
            XCTAssertEqual(user?.gravatar_id, "")
            XCTAssertEqual(user?.url, "https://api.github.com/users/mojombo")
            XCTAssertEqual(user?.html_url, "https://github.com/mojombo")
            XCTAssertEqual(user?.followers_url, "https://api.github.com/users/mojombo/followers")
            XCTAssertEqual(user?.following_url, "https://api.github.com/users/mojombo/following{/other_user}")
            XCTAssertEqual(user?.gists_url, "https://api.github.com/users/mojombo/gists{/gist_id}")
            XCTAssertEqual(user?.starred_url, "https://api.github.com/users/mojombo/starred{/owner}{/repo}")
            XCTAssertEqual(user?.subscriptions_url, "https://api.github.com/users/mojombo/subscriptions")
            XCTAssertEqual(user?.organizations_url, "https://api.github.com/users/mojombo/orgs")
            XCTAssertEqual(user?.repos_url, "https://api.github.com/users/mojombo/repos")
            XCTAssertEqual(user?.events_url, "https://api.github.com/users/mojombo/events{/privacy}")
            XCTAssertEqual(user?.received_events_url, "https://api.github.com/users/mojombo/received_events")
            XCTAssertEqual(user?.type, "User")
            XCTAssertEqual(user?.site_admin, false)
        } catch {
            XCTFail("Decoding failed with error: \(error)")
        }
    }

    // Test case for missing fields in JSON
    func testUserParsingMissingFields() {
        let json = """
        [
            {
                "login": "mojombo",
                "id": 1
            }
        ]
        """.data(using: .utf8)!

        do {
            let users = try JSONDecoder().decode([UserModel].self, from: json)
            XCTAssertEqual(users.count, 1)
            let user = users.first
            XCTAssertEqual(user?.login, "mojombo")
            XCTAssertEqual(user?.id, 1)
            XCTAssertNil(user?.node_id)
            XCTAssertNil(user?.avatar_url)
        } catch {
            XCTFail("Decoding failed with error: \(error)")
        }
    }

    // Test case for invalid JSON format
    func testUserParsingInvalidJson() {
        let json = """
        [
            {
                "login": "mojombo"
                "id": 1
            }
        ]
        """.data(using: .utf8)!

        XCTAssertThrowsError(try JSONDecoder().decode([UserModel].self, from: json)) { error in
            XCTAssertNotNil(error)
        }
    }

    // Test case for empty JSON array
    func testUserParsingEmptyArray() {
        let json = """
        []
        """.data(using: .utf8)!

        do {
            let users = try JSONDecoder().decode([UserModel].self, from: json)
            XCTAssertEqual(users.count, 0)
        } catch {
            XCTFail("Decoding failed with error: \(error)")
        }
    }

    // Test case for null values in JSON
    func testUserParsingNullValues() {
        let json = """
        [
            {
                "login": null,
                "id": null,
                "node_id": null
            }
        ]
        """.data(using: .utf8)!

        do {
            let users = try JSONDecoder().decode([UserModel].self, from: json)
            XCTAssertEqual(users.count, 1)
            let user = users.first
            XCTAssertNil(user?.login)
            XCTAssertNil(user?.id)
        } catch {
            XCTFail("Decoding failed with error: \(error)")
        }
    }
}

