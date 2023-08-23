//
//  ProfileHeaderView.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user : User
    
    var body: some View {
        VStack(spacing: 10){
            // pic and stats
            HStack{
                Image(user.profileImageUrl ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
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
            
            //action button
            Button {
                // action
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width:360, height:32)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray,lineWidth: 1)
                    )
            }
            Divider() // 선 긋기.
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MockUser[0])
    }
}
