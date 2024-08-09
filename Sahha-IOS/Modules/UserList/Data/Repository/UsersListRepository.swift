//
//  UsersListRepository.swift
//  Sahha-IOS
//
//  Created by Rohit Kumar on 08/08/2024.
//

import Foundation

class UsersListRepository {
    private var userListDataSource: UsersListDataSource
    
    init() {
        self.userListDataSource = UsersListDataSource()
    }
    
    func getUsers() async throws -> [UserModel] {
        return try await userListDataSource.getUsers()
    }
    
}
