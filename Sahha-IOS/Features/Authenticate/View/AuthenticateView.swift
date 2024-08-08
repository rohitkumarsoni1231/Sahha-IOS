//
//  AuthenticateView.swift
//  Sahha-IOS
//
//  Created by Rohit Kumar on 08/08/2024.
//

import SwiftUI
import Security

struct AuthenticateView: View {
    
    @State private var externalID = String()
    @ObservedObject var authenticateViewModel: AuthenticateViewModel
    
    private var isExternalIDEmpty: Bool {
        externalID.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("logo-icon").resizable()
                    .frame(width: 150, height: 150)
                    .padding()
                
                Text("Good to see you!")
                    .padding()
                    .font(.title2)
                    .fontWeight(.medium)
                    .bold()
                
                CustomTextField(ourText: $externalID, placeholder: Text("Enter External Id").font(.subheadline), imageIcon: "user-icon")
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray))
                    .padding(.bottom, 250)
                
                Button("Authenticate") {
                    authenticateViewModel.authenticate(externalID: externalID)
                }
                .disabled(isExternalIDEmpty)
                .frame(maxWidth: .greatestFiniteMagnitude, minHeight: 52)
                .foregroundColor(.white).font(.headline)
                .background(isExternalIDEmpty ? Color.gray : Color.app)
                .cornerRadius(8.0)
                
            }
            .padding()
            .ignoresSafeArea()
            .navigationDestination(isPresented: $authenticateViewModel.isAuthenticated) {
                HomeView()
            }
            .alert(isPresented: $authenticateViewModel.isError) {
                Alert(
                    title: Text("Authentication Error"),
                    message: Text(authenticateViewModel.errorMessage ?? "An error occurred during authentication. Please try again."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

#Preview {
    AuthenticateView(authenticateViewModel: AuthenticateViewModel())
}
