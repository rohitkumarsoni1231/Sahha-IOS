//
//  UserRow.swift
//  Sahha-IOS
//
//  Created by Rohit Kumar on 08/08/2024.
//

import SwiftUI

struct UserRow: View {
    var userModel: UserModel?
    
    var body: some View {
        HStack(spacing: 16) {
            if let avatarURL = userModel?.avatar_url, let url = URL(string: avatarURL) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 60, height: 60)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                    case .failure:
                        Image(systemName: "person.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                    @unknown default:
                        EmptyView()
                            .frame(width: 60, height: 60)
                    }
                    
                }
            } else {
                Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(userModel?.login ?? "Unknown User")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text(userModel?.html_url ?? "")
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    .lineLimit(1)
            }
        }
        .padding()
    }
}

#Preview {
    UserRow(userModel: UserModel(login: "Rohit Kumar Soni", id: 1, node_id: "", avatar_url: "https://avatars.githubusercontent.com/u/1?v=4", gravatar_id: "", url: "", html_url: "https://github.com/mojombo", followers_url: "", following_url: "", gists_url: "", starred_url: "", subscriptions_url: "", organizations_url: "", repos_url: "", events_url: "", received_events_url: "", type: "User", site_admin: false))
}
