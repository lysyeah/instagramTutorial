//
//  PostGridView.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/23.
//

import SwiftUI

struct PostGridView: View {
    
    var posts : [Post]
    
    private let imageDimension : CGFloat = (UIScreen.main.bounds.width / 3 ) - 1

    private let gridItems : [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        //post grid view
        LazyVGrid(columns: gridItems, spacing: 2) { // spacing()의 default값은 2보다 크더라.
            ForEach(posts) { post in // \.self는 각각의 사진에게 id를 부여한것이다.
                Image(post.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimension, height: imageDimension)
                    .clipped()
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView(posts: Post.MockPost)
    }
}
