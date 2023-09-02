//
//  ContentView.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/11.
//

import SwiftUI

// This is the root view of out application.
struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registerationViewModel = RegisterationViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
                    .environmentObject(registerationViewModel)
            } else if let currentUser = viewModel.currentUser {
                MainTabView(user: currentUser)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
