//
//  CircularProfileImageView.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/29.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xsmall
    case small
    case medium
    case large
    
    var dimension : CGFloat{
        switch self{
        case .xsmall :
            return 40
        case .small :
            return 48
        case .medium :
            return 64
        case .large :
            return 80
        }
    }
}

struct CircularProfileImageView: View {
    let user : User
    let size : ProfileImageSize
    
    var body: some View {
        if let imageUrl = user.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        }else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
                .foregroundColor(Color(.systemGray5))
        }
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView(user: User.MockUser[0], size: .large)
    }
}
