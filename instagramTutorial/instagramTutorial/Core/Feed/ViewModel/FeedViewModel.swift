//
//  FeedViewModel.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/31.
//

import Foundation
import Firebase


class FeedViewModel : ObservableObject{
    @Published var posts = [Post]()
    
    init() {
        Task { try await fetchPosts() }
    }
    
    @MainActor
    func fetchPosts() async throws{
        
        self.posts = try await PostService.fetchFeedPosts()
        
        /*
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        
         
         /*
         34번 줄과 같은 내용이다.
         self.posts = try snapshot.documents.compactMap({ document in
            let post = try document.data(as: Post.self)
            return post
        })
        */
         
         
        self.posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
        
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            self.posts[i].user = postUser
        }
        */
    }
}
