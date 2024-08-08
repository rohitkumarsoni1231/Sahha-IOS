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
    
    func authenticate(externalID: String) {
        Sahha.authenticate(appId: "G7CYZB7EN799Z4ADAT4R07OWXGOVDPGQ", appSecret: "HoMQjftuwV1sYZdfjJmHRkFbQndAuKeX+aV3YPpFS8w=", externalId: externalID) { error, success in
            if let error = error {
                print("Error: \(error)")
                self.errorMessage = error
                self.isError = true
            } else if success {
                self.isAuthenticated = success
                print("You are now authenticated")
                if let token = Sahha.profileToken {
                    print("User has a token \(token)")
                } else {
                    print("User does not have a token")
                }
            }
        }
    }
    
    func deAuthenticate() {
        Sahha.deauthenticate { error, success in
            if let error = error {
                print(error)
            } else if success {
                print("You are now deauthenticated")
            }
        }
    }
    
}
