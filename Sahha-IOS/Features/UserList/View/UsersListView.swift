//
//  UsersListView.swift
//  Sahha-IOS
//
//  Created by Rohit Kumar on 08/08/2024.
//

import SwiftUI

struct UsersListView: View {
    
    @ObservedObject private var userListViewModel = UsersListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                List {
                    ForEach(userListViewModel.userModel) { user in
                        NavigationLink {
                            
                        } label: {
                            UserRow(userModel: user)
                        }
                    }
                }
            }.onAppear {
                userListViewModel.fetchUsers()
            }
            .navigationTitle("Users List")
            .alert(isPresented: $userListViewModel.isError) {
                Alert(
                    title: Text("Authentication Error"),
                    message: Text(userListViewModel.errorMessage ?? "An error occurred. Please try again."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

#Preview {
    UsersListView()
}
