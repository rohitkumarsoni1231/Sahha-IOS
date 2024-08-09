//
//  UserListUseCase.swift
//  Sahha-IOS
//
//  Created by Rohit Kumar on 09/08/2024.
//

import Foundation

protocol DefaultUserListUseCase {
    func getUsers() async throws -> [UserModel]
}

class UserListUseCase : DefaultUserListUseCase {
    
    private var repository: UsersListRepository
    
    init(repository: UsersListRepository) {
        self.repository = repository
    }
    
    func getUsers() async throws -> [UserModel] {
        return try await repository.getUsers()
    }
    
}
