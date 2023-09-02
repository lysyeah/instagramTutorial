//
//  SearchView.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/21.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack(spacing: 12){
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) { // Model/User에 Hashable Protocol 추가함. // Hashable 공부할 사항. // value.
                            HStack {
                                CircularProfileImageView(user: user, size: .xsmall)
                                VStack(alignment: .leading){
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                    Text(user.fullname ?? "") // 나는 이렇게 할것이고
                                    /*
                                     이렇게 하는 방법도 있다.
                                     if let fullname = user.fullname {
                                        Text(fullname)
                                     }
                                     
                                     Collie5 의 fullname을 nil로 설정해두어서 없는 것이다. 일부러. 비교를 위해서.
                                     */
                                }
                                .font(.footnote)
                                Spacer()
                            }
                        }
                        .foregroundColor(.black) // default 값이 파란색이라서 검은색으로 설정을 해주었다.
                        .padding(.horizontal) // leading VS horizontal
                    }
                }
                .padding(.top, 8)
                .searchable(text: $searchText, prompt: "Search..." ) // swiftUI 짱 !!
            }
            .navigationDestination(for: User.self, destination: { user in // 사용자들은 고유 식별자가 있다.
                ProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
