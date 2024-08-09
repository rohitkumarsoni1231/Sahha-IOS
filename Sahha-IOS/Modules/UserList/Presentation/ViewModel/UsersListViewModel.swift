//
//  UsersListViewModel.swift
//  Sahha-IOS
//
//  Created by Rohit Kumar on 08/08/2024.
//

import Foundation
import Sahha

class UsersListViewModel : ObservableObject {
    
    @Published var userModel = [UserModel]()
    
    private var userListUseCase : UserListUseCase
    @Published var isError = false
    @Published var errorMessage : String?
    
    init(userListUseCase: UserListUseCase = UserListUseCase(repository: UsersListRepository())) {
        self.userListUseCase = userListUseCase
    }
    
    @MainActor func fetchUsers() {
        Task {
            do {
                let users = try await userListUseCase.getUsers()
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
    
    func deAuthenticate() {
        Sahha.deauthenticate { error, success in
            DispatchQueue.main.async {
                if let error = error {
                    print("Deauthentication error: \(error)")
                } else if success {
                    print("You are now deauthenticated")
                }
            }
        }
    }
}
