//
//  UserProfileViewModel.swift
//  Sahha-IOS
//
//  Created by Rohit Kumar on 09/08/2024.
//

import Foundation
import Sahha

class UserProfileViewModel: ObservableObject {
    
    @Published var userData: SahhaDemographic?
    @Published var isError = false
    @Published var errorMessage: String?
    
    func getUserProfile() {
        Sahha.getDemographic { error, response in
            if let error {
                self.errorMessage = error
                self.isError = true
            } else if let response {
                self.userData = response
                print(response)
            }
        }
    }
    
}
