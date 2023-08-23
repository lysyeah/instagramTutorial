//
//  User.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/22.
//

import Foundation

struct User : Identifiable, Codable, Hashable {
    let id: String
    let email : String
    var username : String
    var profileImageUrl : String?
    var fullname : String?
    var bio : String?
}

extension User {
    static var MockUser : [User] = [
        .init(id: NSUUID().uuidString, email: "collie1@gmail.com", username: "Collie1", profileImageUrl: "dog1", fullname: "bordercoliie1", bio: "Apple"),
        .init(id: NSUUID().uuidString, email: "collie2@gmail.com", username: "Collie2", profileImageUrl: "dog2", fullname: "bordercoliie2", bio: "Boat"),
        .init(id: NSUUID().uuidString, email: "collie3@gmail.com", username: "Collie3", profileImageUrl: "dog3", fullname: "bordercoliie3", bio: "Cigarette"),
        .init(id: NSUUID().uuidString, email: "collie4@gmail.com", username: "Collie4", profileImageUrl: "dog4", fullname: "bordercoliie4", bio: "Definite"),
        .init(id: NSUUID().uuidString, email: "collie5@gmail.com", username: "Collie5", profileImageUrl: "dog5", fullname: nil, bio: "Explore")
    ]
}
