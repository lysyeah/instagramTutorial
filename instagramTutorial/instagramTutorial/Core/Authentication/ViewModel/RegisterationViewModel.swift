//
//  RegisterationViewModel.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/24.
//

import Foundation

class RegisterationViewModel : ObservableObject {
    // 밑 published 3가지는 뷰모델의 모든것들을 추적하기 위함이다. 즉, 사용자가 어떤 이름,이메일,암호를 타이핑했는지를 추적.
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    

    func createUser() async throws{
       try await AuthService.shared.createUser(email: email, password: password, username: username)
        
        // 로그아웃 후에 create를 하면 전에 써놓은 이메일,유저아이디,비번이 그대로 있어서 삭제를 해줘야한다.
        email = ""
        username = ""
        password = ""
    }
}
