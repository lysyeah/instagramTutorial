//
//  ProfileView.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/12.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var posts : [Post] {
        return Post.MockPost.filter({ $0.user?.username == user.username })
    }
    
    var body: some View {
//        NavigationStack { // ScrollView 드래그 커맨드 클릭해서 enbed Vstack 눌러서 Vstack을 NavigationStack로 변경함
        // searchView에서 user를 클릭했을 때 문제가 생겨서 이를 해결하기 위해 주석처리를 했다.
            ScrollView{ // Hstack으로 하던걸 Scroll을 위해서 ScrollView로 바꿨다.
                //header
                ProfileHeaderView(user: user)
                //post grid view
                PostGridView(posts: posts)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            /* 이 부분은 CurrentUser만 사용하는 기능이기 떄문에 주석처리.
            .toolbar {
                Button {
                    //action
                } label: {
                    Image(systemName: "line.3.horizontal") // SF symbols
                        .foregroundColor(.black)
                }
            }
             */
        }
    }
//}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MockUser[0])
    }
}
