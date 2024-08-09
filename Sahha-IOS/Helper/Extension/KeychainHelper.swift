//
//  KeychainHelper.swift
//  Sahha-IOS
//
//  Created by Rohit Kumar on 08/08/2024.
//

import Foundation
import Security

import Foundation
import Security

// A helper class for managing keychain operations.
class KeychainHelper {
    
    private let keychainKeys = (appId: "appId", appSecret: "appSecret", externalId: "externalId", profileToken: "profileToken")
    
    // Saves data to the keychain.
    static func save(key: String, data: Data) -> Bool {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]
        
        // Delete any existing item with the same key.
        SecItemDelete(query as CFDictionary)
        
        let status = SecItemAdd(query as CFDictionary, nil)
        return status == errSecSuccess
    }
    
    // Loads data from the keychain.
    static func load(key: String) -> Data? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        return status == errSecSuccess ? dataTypeRef as? Data : nil
    }
    
    // Deletes data from the keychain.
    static func delete(key: String) -> Bool {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        return status == errSecSuccess
    }
    
    // Saves user credentials to the keychain.
    func saveCredentials(appId: String, appSecret: String, externalId: String, profileToken: String) {
        if let appIdData = appId.data(using: .utf8),
           let appSecretData = appSecret.data(using: .utf8),
           let externalIdData = externalId.data(using: .utf8),
           let profileToken = externalId.data(using: .utf8) {
            
            _ = KeychainHelper.save(key: keychainKeys.appId, data: appIdData)
            _ = KeychainHelper.save(key: keychainKeys.appSecret, data: appSecretData)
            _ = KeychainHelper.save(key: keychainKeys.externalId, data: externalIdData)
            _ = KeychainHelper.save(key: keychainKeys.profileToken, data: profileToken)
            print("Credentials saved successfully")
        }
    }
    
    // Retrieves user credentials from the keychain.
    func getCredentials() -> (appId: String?, appSecret: String?, externalId: String?, profileToken: String?) {
        let appId = KeychainHelper.load(key: keychainKeys.appId)
        let appSecret = KeychainHelper.load(key: keychainKeys.appSecret)
        let externalId = KeychainHelper.load(key: keychainKeys.externalId)
        let profileToken = KeychainHelper.load(key: keychainKeys.profileToken)
        
        return (
            appId: appId.flatMap { String(data: $0, encoding: .utf8) },
            appSecret: appSecret.flatMap { String(data: $0, encoding: .utf8) },
            externalId: externalId.flatMap { String(data: $0, encoding: .utf8) },
            profileToken: profileToken.flatMap { String(data: $0, encoding: .utf8) }
        )
    }
}
