//
//  FeedView.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/21.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack(spacing: 32){
                    ForEach(viewModel.posts) { post in
                        FeedCell(post: post)
                    }
                }
                .padding(.top, 10)
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Image("instagramLogo")
                        .resizable()
                        .frame(width: 100, height: 32)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Image(systemName: "paperplane")
                        /*
                         .resizable()
                         .frame(width: 20, height: 20)
                         */
                        .imageScale(.large) // 이 방법도 있음.
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
