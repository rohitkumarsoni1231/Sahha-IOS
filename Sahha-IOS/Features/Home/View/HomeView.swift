//
//  HomeView.swift
//  Sahha-IOS
//
//  Created by Rohit Kumar on 08/08/2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var authenticateViewModel = AuthenticateViewModel()
    @State private var isAuthenticated = false
    @ObservedObject private var usersListViewModel = UsersListViewModel()
    
    var body: some View {
        NavigationView {
            if isAuthenticated {
                TabView {
                    UsersListView()
                        .tabItem {  
                            Label("Users", systemImage: "list.bullet")
                        }
                    
                    ScoresInsightsView()
                        .tabItem {
                            Label("Scores", systemImage: "chart.bar")
                        }
                }
            } else {
                AuthenticateView(authenticateViewModel: authenticateViewModel)
                    .onReceive(authenticateViewModel.$isAuthenticated) { authenticated in
                        self.isAuthenticated = authenticated
                    }
            }
        }
    }
}

#Preview {
    HomeView()
}
