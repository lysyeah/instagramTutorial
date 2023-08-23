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
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
            }else{
                mainTabView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
