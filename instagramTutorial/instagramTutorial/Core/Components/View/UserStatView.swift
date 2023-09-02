//
//  UserStatView.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/21.
//

import SwiftUI

struct UserStatView: View {
    let value : Int
    let title : String
    
    var body: some View {
        VStack{
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Text(title)
                .font(.footnote)
        }
        .frame(width: 76)
    }
}

struct UserStatView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatView(value: 3, title: "Posts")
    }
}
