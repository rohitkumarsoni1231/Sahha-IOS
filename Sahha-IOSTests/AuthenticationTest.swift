//
//  AuthenticationTest.swift
//  Sahha-IOSTests
//
//  Created by Rohit Kumar on 08/08/2024.
//

import UIKit
import XCTest
@testable import Sahha_IOS

class AuthenticationTest: XCTestCase {
    
    var authenticateViewModel: AuthenticateViewModel!
    var view: AuthenticateView!
    
    override func setUp() {
        super.setUp()
        authenticateViewModel = AuthenticateViewModel()
        view = AuthenticateView(authenticateViewModel: authenticateViewModel)
    }
    
    override func tearDown() {
        authenticateViewModel = nil
        view = nil
        super.tearDown()
    }
    
    func testAuthenticateButtonDisabledWhenExternalIDIsEmpty() {
//        view.externalID = ""
//        view.appId = ""
//        view.appSecret = ""
//        
//        // When
//        let isButtonDisabled = view.isExternalIDEmpty
//        
//        // Then
//        XCTAssertTrue(isButtonDisabled, "Authenticate button should be disabled when externalID is empty")
        
    }
    

}
