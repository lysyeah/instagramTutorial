//
//  CreatePasswordView.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/22.
//

import SwiftUI

struct CreatePasswordView: View {
//    @State private var password = "" // 여기도 마찬가지.
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel : RegisterationViewModel
    
    var body: some View {
            VStack(spacing: 12){
                Text("Create a password")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                Text("Your password must be at least 6 characters in length")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                SecureField("Password", text: $viewModel.password )
                    .autocapitalization(.none)
                    .modifier(IGTextFieldModifier())
                    .padding(.top)
                NavigationLink { // Button으로 만들었던 것을 NavigationLink로 변경했다.
                    CompleteSignUpView()
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


struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordView()
    }
}
