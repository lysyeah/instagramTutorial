//
//  LoginView.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/21.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                
                Spacer()
                
                //logo image
                Image("instagramLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                // text field
                VStack{
                    TextField("Endter yout email", text: $email)
                        .autocapitalization(.none)
                        .modifier(IGTextFieldModifier())
                    SecureField("Endter yout password", text: $password)
                      //.autocapitalization(.none) 기본적으로 none으로 설정되어 있다.
                        .modifier(IGTextFieldModifier())
                }
                // Forgot password?
                Button {
                    print("Show fotgot password")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing) // maxWidth로 설정하는거 까먹지 않기.
                
                // Login
                Button {
                    print("Login")
                } label: {
                    Text("Log in")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 44)
                        .cornerRadius(8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                    
                }
                .padding(.vertical)
                
                // Or & Divider-ish
                HStack{
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 50, height: 1)
                    
                    Text("Or")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 50, height: 1)
                }
                .foregroundColor(.gray)
                
                // With facebook
                HStack{
                    Image("facebookLogo")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Continue with facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                }
                .padding(.top, 8)
                
                Spacer() // 여기 위에거 위로 쫙 올려
                
                Divider() // 구분선.
                
                // Don't have an account?의 네비게이션 링크.
                // NavigationStack안에 있기 때문에 이렇게 사용한다.
                NavigationLink {
                    AddEmailView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 5){
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.top, 20)
            }
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
