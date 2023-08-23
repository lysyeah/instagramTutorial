//
//  CompleteSignUpView.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/22.
//

import SwiftUI

struct CompleteSignUpView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 12){
            Spacer()
            
            Text("Welcom to instagram")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top)
                .multilineTextAlignment(.center)

            Text("Click below to complete registeration and start using instagram")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            Button {
                // Button으로 시작해서 NavigationLink로 썼었지만,
                // CompleteSignUpView 에서는 Button으로 사용할 것이다.
                print("comeplete sign up")
            } label: {
                Text("Complete Sign Up")
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

struct CompleteSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSignUpView()
    }
}
