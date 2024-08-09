//
//  SahhaMock.swift
//  Sahha-IOSTests
//
//  Created by Rohit Kumar on 09/08/2024.
//

import Foundation

class SahhaMock {
    var success = true
    var error: String?
    
    func authenticate(appId: String, appSecret: String, externalId: String, completion: @escaping (String?, Bool) -> Void) {
           if success {
               completion(nil, true)
           } else {
               completion(error, false)
           }
       }
}
