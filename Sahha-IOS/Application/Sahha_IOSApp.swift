//
//  Sahha_IOSApp.swift
//  Sahha-IOS
//
//  Created by Rohit Kumar on 08/08/2024.
//

import SwiftUI
import Sahha

@main
struct Sahha_IOSApp: App {
    
    init() {
        let setting = SahhaSettings(environment: .sandbox)
        Sahha.configure(setting)
        UITextField.appearance().clearButtonMode = .whileEditing
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
