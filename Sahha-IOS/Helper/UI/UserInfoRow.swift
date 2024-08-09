//
//  UserInfoRow.swift
//  Sahha-IOS
//
//  Created by Rohit Kumar on 09/08/2024.
//

import Foundation
import SwiftUI

struct UserInfoRow: View {
    let label: String
    let value: String?

    var body: some View {
        HStack {
            Text("\(label):")
                .fontWeight(.bold)
            Text(value ?? "N/A")
                .foregroundColor(.secondary)
        }
    }
}

