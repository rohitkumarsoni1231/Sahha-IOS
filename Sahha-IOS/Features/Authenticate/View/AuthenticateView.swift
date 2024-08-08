//
//  AuthenticateView.swift
//  Sahha-IOS
//
//  Created by Rohit Kumar on 08/08/2024.
//

import SwiftUI
import Security

struct AuthenticateView: View {
    
    @State private var externalID = ""
    @State private var appId = ""
    @State private var appSecret = ""
    @ObservedObject var authenticateViewModel: AuthenticateViewModel
    
    private var isExternalIDEmpty: Bool {
        externalID.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    private var areCredentialsEmpty: Bool {
        appId.trimmingCharacters(in: .whitespaces).isEmpty ||
        appSecret.trimmingCharacters(in: .whitespaces).isEmpty ||
        externalID.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("logo-icon")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding()
                
                Text("Good to see you!")
                    .font(.title2)
                    .fontWeight(.medium)
                    .bold()
                    .padding()
                
                CustomSecureTextField(ourText: $appId, placeholder: Text("Enter App ID").font(.subheadline))
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
                
                CustomSecureTextField(ourText: $appSecret, placeholder: Text("Enter App Secret").font(.subheadline))
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
                
                CustomSecureTextField(ourText: $externalID, placeholder: Text("Enter External ID").font(.subheadline))
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
            
                Button("Authenticate") {
                    if !areCredentialsEmpty {
                        authenticateViewModel.authenticate(appId: appId, appSecret: appSecret, externalId: externalID)
                    }
                   
                }
                .disabled(isExternalIDEmpty)
                .frame(maxWidth: .infinity, minHeight: 52)
                .foregroundColor(.white)
                .font(.headline)
                .background(areCredentialsEmpty ? Color.gray : .app)
                .cornerRadius(8.0)
                .padding(.top, 36)
                
            }
            .padding()
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
