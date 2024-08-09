//
//  UserProfileView.swift
//  Sahha-IOS
//
//  Created by Rohit Kumar on 09/08/2024.
//

import SwiftUI

struct UserProfileView: View {
    @ObservedObject private var viewModel = UserProfileViewModel()
    
    var body: some View {
        VStack {
            if let userData = viewModel.userData {
                UserInfoView(userData: userData)
            } else if viewModel.isError {
                Text(viewModel.errorMessage ?? "An error occurred")
                    .foregroundColor(.red)
            } else {
                NoDataView()
            }
        }
        .onAppear {
            viewModel.getUserProfile()
        }
    }
}

#Preview {
    UserProfileView()
}
