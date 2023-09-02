//
//  Post.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/23.
//

import Foundation
import Firebase

struct Post : Identifiable, Hashable, Codable {
    let id : String
    let ownerUid : String
    let caption : String
    var likes : Int
    let imageUrl :String
    let timeStamp : Timestamp
    var user : User?
}

extension Post {
    static var MockPost : [Post] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This is some tests for caption function",
            likes: 123,
            imageUrl: "dog1",
            timeStamp: Timestamp(),
            user : User.MockUser[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "One",
            likes: 33,
            imageUrl: "dog2",
            timeStamp : Timestamp(),
            user: User.MockUser[1]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Two",
            likes: 23,
            imageUrl: "dog3",
            timeStamp : Timestamp(),
            user : User.MockUser[2]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Four",
            likes: 100,
            imageUrl: "dog4",
            timeStamp : Timestamp(),
            user : User.MockUser[3]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Five",
            likes: 53,
            imageUrl: "dog5",
            timeStamp : Timestamp(),
            user : User.MockUser[4]
        )
    ]
}

