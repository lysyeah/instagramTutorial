//
//  addEmailView.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/21.
//

import SwiftUI

struct AddEmailView: View {
//    @State private var email = "" //26번줄에 $email을 $viewModel.email로 바꾸었기 때문에, 이것을 필요가 없어졌다. 
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel : RegisterationViewModel
    
    var body: some View {
        VStack(spacing: 12){
            Text("Add your email")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top)
            Text("You'll use this email to sign in to your account")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            TextField("Email", text: $viewModel.email )
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
            NavigationLink { // Button으로 만들었던 것을 NavigationLink로 변경했다.
                CreateUserNameView()
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

struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
        AddEmailView()
    }
}
