//
//  CustomTextField.swift
//  Sahha-IOS
//
//  Created by Rohit Kumar on 08/08/2024.
//

import Foundation
import SwiftUI

struct CustomTextField : View {
    
    @Binding var ourText: String
    let placeholder : Text
    let imageIcon : String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if ourText.isEmpty {
                placeholder
                    .foregroundStyle(.gray)
                    .padding(.leading, 24)
            }
            
            HStack(spacing: 10) {
                Image(imageIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .foregroundStyle(.white)
                
                TextField("", text: $ourText)
                
            }
        }
    }
}
