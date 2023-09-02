//
//  CurrentProfileView.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/22.
//

import SwiftUI

struct CurrentUserView: View {
    let user : User
    
    var body: some View {
        NavigationStack {
            ScrollView{ // Hstack으로 하던걸 Scroll을 위해서 ScrollView로 바꿨다.
                //header
                ProfileHeaderView(user: user)
                //post grid view
                PostGridView(user: user)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    //action
                    AuthService.shared.signout()
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

