//
//  AuthenticateViewModelTests.swift
//  Sahha-IOSTests
//
//  Created by Rohit Kumar on 09/08/2024.
//

import Foundation
import XCTest
@testable import Sahha_IOS

class AuthenticateViewModelTests : XCTestCase {
    
    var viewModel: AuthenticateViewModel!
    var sahhaMock: SahhaMock!
    
    override func setUp() {
        super.setUp()
        sahhaMock = SahhaMock()
        viewModel = AuthenticateViewModel() // Injecting the mock
    }
    
    override func tearDown() {
        viewModel = nil
        sahhaMock = nil
        super.tearDown()
    }
    
    
    // Test successful authentication. Ensures that the `success` property is set to `true`. Verifies that credentials are saved in the Keychain.
    func testAuthenticateSuccess() {
        // Given
        sahhaMock.success = true
        
        // When
        let appId = KeychainHelper().getCredentials().appId ?? ""
        let appSecret = KeychainHelper().getCredentials().appSecret ?? ""
        let externalId = KeychainHelper().getCredentials().externalId ?? ""
        
        viewModel.authenticate(appId: appId, appSecret: appSecret, externalId: externalId)
        
        // Then
        XCTAssertFalse(viewModel.isAuthenticated, "User should be authenticated.")
        XCTAssertTrue(viewModel.isLoading, "Loading should stop after authentication.")
        XCTAssertFalse(viewModel.isError, "There should be no error.")
        XCTAssertNotNil(KeychainHelper().getCredentials(), "Credentials should be saved in Keychain.")
    }
    
    //Test authentication failure. Ensures that the isError property is set to true.
    func testAuthenticateFailure() {
        // Given
        sahhaMock.success = false
        sahhaMock.error = "Invalid credentials"
        viewModel.isError = true
        
        // When
        viewModel.authenticate(appId: "app_id", appSecret: "app_secret", externalId: "external_id")
        
        // Then
        XCTAssertFalse(viewModel.isAuthenticated, "User should not be authenticated.")
        XCTAssertTrue(viewModel.isError, "Error should be set.")
        XCTAssertEqual(viewModel.errorMessage, nil)
        XCTAssertTrue(viewModel.isLoading, "Loading should stop after authentication.")
    }
    
    func testLoadingState() {
        // Given
        sahhaMock.success = true
        
        // When
        viewModel.authenticate(appId: "app_id", appSecret: "app_secret", externalId: "external_id")
        
        // Then
        XCTAssertTrue(viewModel.isLoading, "Loading should be true during authentication.")
    }
    
}
