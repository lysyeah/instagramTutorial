//
//  User.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/22.
//

import Foundation
import Firebase

struct User : Identifiable, Codable, Hashable {
    let id: String
    let email : String
    var username : String
    var profileImageUrl : String?
    var fullname : String?
    var bio : String?
    
    var isCurrentUser : Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension User {
    static var MockUser : [User] = [
        .init(id: NSUUID().uuidString, email: "collie1@gmail.com", username: "Collie1", profileImageUrl: nil, fullname: "bordercoliie1", bio: "Apple"),
        .init(id: NSUUID().uuidString, email: "collie2@gmail.com", username: "Collie2", profileImageUrl: nil, fullname: "bordercoliie2", bio: "Boat"),
        .init(id: NSUUID().uuidString, email: "collie3@gmail.com", username: "Collie3", profileImageUrl: nil, fullname: "bordercoliie3", bio: "Cigarette"),
        .init(id: NSUUID().uuidString, email: "collie4@gmail.com", username: "Collie4", profileImageUrl: nil, fullname: "bordercoliie4", bio: "Definite"),
        .init(id: NSUUID().uuidString, email: "collie5@gmail.com", username: "Collie5", profileImageUrl: nil, fullname: nil, bio: "Explore")
    ]
}
