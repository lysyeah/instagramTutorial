//
//  mainTabView.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/11.
//

import SwiftUI

struct mainTabView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView {
            FeedView()
                .onAppear{
                    selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            
            SearchView()
                .onAppear{
                    selectedIndex = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            
            UploadPostView(tabIndex: $selectedIndex)
                .onAppear{
                    selectedIndex = 2
                }
                .tabItem {
                    Image(systemName: "plus.square")
                }.tag(2)
            
            Text("Notification")
                .onAppear{
                    selectedIndex = 3
                }
                .tabItem {
                    Image(systemName: "heart")
                }.tag(3)
            
            /*
             ProfileView 초기작업.
             Text("Profile")
                .tabItem {
                    Image(systemName: "person")
                }
            */
            CurrentUserView(user: User.MockUser[0])
                .onAppear{
                    selectedIndex = 4
                }
                .tabItem {
                    Image(systemName: "person")
                }.tag(4)
        }
        .accentColor(.black)
    }
}

struct mainTabView_Previews: PreviewProvider {
    static var previews: some View {
        mainTabView()
    }
}
