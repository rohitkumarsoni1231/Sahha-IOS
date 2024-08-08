//
//  CustomSecureTextField.swift
//  Sahha-IOS
//
//  Created by Rohit Kumar on 08/08/2024.
//

import Foundation
import SwiftUI

struct CustomSecureTextField : View {
    
    @Binding var ourText: String
    let placeholder : Text
    
    var body: some View {
        ZStack(alignment: .leading) {
            if ourText.isEmpty {
                placeholder
                    .foregroundStyle(.gray)
                    .padding(.leading, 24)
            }
            
            HStack(spacing: 10) {
                Image("lock-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .foregroundStyle(.white)
                
                SecureField("", text: $ourText)
            }
        }
    }
}
