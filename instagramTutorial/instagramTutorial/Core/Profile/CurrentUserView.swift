//
//  CurrentProfileView.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/22.
//

import SwiftUI

struct CurrentUserView: View {
    
    let user : User
    
    var posts : [Post] {
        return Post.MockPost.filter({ $0.user?.username == user.username })
    }
    
    var body: some View {
        NavigationStack {
            ScrollView{ // Hstack으로 하던걸 Scroll을 위해서 ScrollView로 바꿨다.
                //header
                ProfileHeaderView(user: user)
                //post grid view
                PostGridView(posts: posts)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    //action
                } label: {
                    Image(systemName: "line.3.horizontal") // SF symbols
                        .foregroundColor(.black)
                }
            }
        }
    }
}
struct CurrentUserView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserView(user: User.MockUser[0])
    }
}
