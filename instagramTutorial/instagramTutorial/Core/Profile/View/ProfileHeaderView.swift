//
//  ProfileHeaderView.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user : User
    @State var showEditProfile : Bool = false
    
    var body: some View {
        VStack(spacing: 10){
            // pic and stats
            HStack{
                CircularProfileImageView(user: user, size: .large)
                
                Spacer()
                
                HStack(spacing: 8){
                    UserStatView(value: 3, title: "Posts")
                    UserStatView(value: 30, title: "Followers")
                    UserStatView(value: 45, title: "Following")
                }
            }
            .padding(.horizontal)
            
            //name and bio
            VStack(alignment: .leading){
                if let fullname = user.fullname {
                    Text(fullname)
                        .fontWeight(.semibold) // bold보다는 작은.
                }
                if let bio = user.bio {
                    Text(bio)
                }
            }
//                .background(.blue) 크기 확인하려고 색깔 입혔음.
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .font(.footnote) // 크기 작게.
            
            //action button, Edit Profile || Follow Button
            Button {
                // action
                if user.isCurrentUser {
                    showEditProfile.toggle()
                }else {
                    print("Follow users..")
                }
            } label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width:360, height:32)
                    .background(user.isCurrentUser ? .white : Color(.systemBlue))
                    .foregroundColor(user.isCurrentUser ? .black : .white)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 1)
                    )
            }
            Divider() // 선 긋기.
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MockUser[0])
    }
}
