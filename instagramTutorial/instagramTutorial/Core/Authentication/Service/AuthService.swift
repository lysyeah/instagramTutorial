//
//  AuthService.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/23.
//

import Foundation
import FirebaseAuth

class AuthService {
    
    @Published var userSession : FirebaseAuth.User? // FirebaseAuth에 등록된 유저인지 확인하는 기능.
    
    static let shared = AuthService()
    
    init(){
        self.userSession = Auth.auth().currentUser
    }
    
    func login ( withEmail email : String, password : String ) async throws {
        
    }
    
    func createUser ( email : String, password : String, username : String ) async throws {
            
    }
    
    func loadUserData() async throws {
        
    }
    
    func signout() {
        
    }
    
}
