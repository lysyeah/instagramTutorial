//
//  EditProfileView.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/29.
//

import SwiftUI
import PhotosUI


struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel : EditProfileViewModel
    
    init(user : User){
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    var body: some View {
        VStack{
            //tool bar
            VStack {
                HStack{
                    Button("cancle"){
                        dismiss()
                    }
                    Spacer()
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Spacer()
                    Button {
                        Task {
                            try await viewModel.updateUserData()
                            dismiss()
                        }
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                }
                .padding(.horizontal)
            }
            Divider()
            // Edit Profile pic
            PhotosPicker (selection : $viewModel.selectedImage){
                VStack{
                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .frame(width: 80, height: 80)
                            .background(.gray)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    } else {
                        CircularProfileImageView(user: viewModel.user, size: .large)
                    }
                    Text("Edit Profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Divider()
                }
                .padding(.vertical, 8)
            }
            // Edit profile info
            VStack{
                EditProfileRowView(title: "Name", placeholder: "Enter your name", text: $viewModel.fullname)
                EditProfileRowView(title: "Bio", placeholder: "Enter your bio", text: $viewModel.bio)
            }
            Spacer()
        }
    }
}

// Edit profile info 이쁘게 만들기.
struct EditProfileRowView : View {
    let title : String
    let placeholder : String
    @Binding var text : String
    
    var body : some View {
        HStack{
            Text(title)
                .padding(.leading,8)
                .frame(width: 100, alignment: .leading)
            VStack{
                TextField(placeholder, text: $text)
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}



struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: User.MockUser[0])
    }
}
