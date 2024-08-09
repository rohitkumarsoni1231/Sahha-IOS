//
//  UserInfoView.swift
//  Sahha-IOS
//
//  Created by Rohit Kumar on 09/08/2024.
//

import Foundation
import SwiftUI
import Sahha

struct UserInfoView: View {
    let userData: SahhaDemographic

    var body: some View {
        Group {
            UserInfoRow(label: "Age", value: "\(userData.age ?? 0)")
            UserInfoRow(label: "Gender", value: userData.gender)
            UserInfoRow(label: "Birth Date", value: userData.birthDate)
            UserInfoRow(label: "Country", value: userData.country)
            UserInfoRow(label: "Occupation", value: userData.occupation)
            UserInfoRow(label: "Education", value: userData.education)
        }
    }
}
