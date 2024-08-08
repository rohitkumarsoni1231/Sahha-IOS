//
//  UsersListDataSource.swift
//  Sahha-IOS
//
//  Created by Rohit Kumar on 08/08/2024.
//

import Foundation

class UsersListDataSource {
    func getUsers() async throws -> [UserModel] {
//        users
        guard let url = URL(string: "https://api.github.com/users") else {
            throw NetworkError.badURL
        }
        return try await APIManager().request(url: url)
    }
}
