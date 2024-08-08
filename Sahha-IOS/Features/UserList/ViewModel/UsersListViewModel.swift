//
//  UsersListViewModel.swift
//  Sahha-IOS
//
//  Created by Rohit Kumar on 08/08/2024.
//

import Foundation

class UsersListViewModel : ObservableObject {
    
    @Published var userModel = [UserModel]()
    
    private var repository : UsersListRepository
    @Published var isError = false
    @Published var errorMessage : String?
    
    init() {
        self.repository = UsersListRepository()
    }
    
    @MainActor func fetchUsers() {
        Task {
            do {
                let users = try await repository.getUsers()
                self.userModel = users
            } catch NetworkError.badURL {
                self.isError = true
                self.errorMessage = "Error: Bad URL"
            } catch NetworkError.invalidResponse {
                self.isError = true
                self.errorMessage = "Error: Invalid Response"
            } catch NetworkError.decodingError {
                self.isError = true
                self.errorMessage = "Error: \(NetworkError.decodingError)"
            } catch NetworkError.customError(let unknownError) {
                self.isError = true
                self.errorMessage = "Error: \(unknownError)"
            } catch {
                self.isError = true
                self.errorMessage = "Error: \(error.localizedDescription)"
            }
        }
    }
}
