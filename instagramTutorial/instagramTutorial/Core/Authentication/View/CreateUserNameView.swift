//
//  CreateUserNameView.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/21.
//

import SwiftUI

struct CreateUserNameView: View {
//    @State private var userName = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel : RegisterationViewModel //11번 주석하고이거 넣음.
    
    var body: some View {
        VStack(spacing: 12){
            Text("Create username")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top)
            Text("Pick a username for your new account. You can always change it later.")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            TextField("Username", text: $viewModel.username )
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
            NavigationLink { // Button으로 만들었던 것을 NavigationLink로 변경했다.
                CreatePasswordView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 44)
                    .cornerRadius(8)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
            }
            .padding(.vertical)
            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

struct CreateUserNameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserNameView()
    }
}
