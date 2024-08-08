//
//  AuthenticateViewModel.swift
//  Sahha-IOS
//
//  Created by Rohit Kumar on 08/08/2024.
//

import Foundation
import Sahha
import Security

class AuthenticateViewModel: ObservableObject {
    
    @Published var isAuthenticated = false
    @Published var isError = false
    @Published var errorMessage: String?
    
    func authenticate(appId: String, appSecret: String, externalId: String) {
        Sahha.authenticate(appId: appId, appSecret: appSecret, externalId: externalId) { [weak self] error, success in
            DispatchQueue.main.async {
                guard let self = self else { return }
                if let error = error {
                    self.errorMessage = error
                    self.isError = true
                } else if success {
                    self.isAuthenticated = true
                    if let token = Sahha.profileToken {
                        KeychainHelper().saveCredentials(appId: appId, appSecret: appSecret, externalId: externalId, profileToken: token)
                        print("User has a token: \(token)")
                    } else {
                        print("User does not have a token")
                    }
                }
            }
        }
    }
    
}
