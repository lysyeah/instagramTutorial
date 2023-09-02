//
//  FeedCell.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/21.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    let post : Post
    var body: some View {
        VStack{
            // image + userName
            HStack{
                if let user = post.user {
                    CircularProfileImageView(user: user, size: .xsmall)
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Spacer()
                }
            }
            .padding(.leading, 8)
            
            //post image
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            //action Buttons
            HStack(spacing: 15){
                //Likes
                Button {
                    print("Like post")
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                //Comments
                Button {
                    print("Comment on post")
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                //Sharing
                Button {
                    print("Share post")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                Spacer()
            }
            .padding(.leading, 8)
            .foregroundColor(.black)
            .padding(.top, 4)
            
            // likes label
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            
            // caption label
            HStack{
                Text("\(post.user?.username ?? "") ").fontWeight(.semibold) +
                Text(post.caption) // 이렇게 길어지면 yongsoo의 height가 달라져서 이를 방지하기 위해 Text 사이에 + 를 한 것이다.
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
            .padding(.top, 1)
            
            Text("6h ago")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .foregroundColor(.gray)

        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.MockPost[0])
    }
}
