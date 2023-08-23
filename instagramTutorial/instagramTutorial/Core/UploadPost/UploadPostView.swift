//
//  UploadPostView.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/23.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var caption = ""
    @State private var imagePickerPresented = false
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex : Int
    
    var body: some View {
        VStack{
            //action tool bar
            HStack{
                Button {
                    caption = ""
                    viewModel.postImage = nil
                    viewModel.selectedImage = nil
                    tabIndex = 0
                } label: {
                    Text("Cancle")
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    print("Upload")
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)
            
            //post image and caption
            HStack(spacing: 8){
                if let image = viewModel.postImage {
                    image // 이 순서대로 해야하는 이유가 있다.
                          // 1.사이즈를바꿀수있고 2.스케일을꽉채울것이고 3.스케일을지정할것이고 4. load됐을때 사이즈를 그대로 가져갈 것이다.
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                
                TextField("Enter the caption ...", text : $caption, axis : .vertical)
                //axis : .vertical : 글자를 길게 쓸 때 화면을 넘어가려고 하는 것을 방지하고 밑줄로 넘어간다.
                //axis : .horizontal로 해보니 쭉 이어지더라.
            }
            .padding()
            
            Spacer()
        }
        .photosPicker(isPresented: $imagePickerPresented,
                      selection: $viewModel.selectedImage)
        .onAppear{
            imagePickerPresented.toggle()
        }
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(tabIndex: .constant(0))
    }
}
