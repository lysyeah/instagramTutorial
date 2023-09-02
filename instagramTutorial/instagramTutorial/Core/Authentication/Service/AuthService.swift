//
//  AuthService.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/23.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase
import FirebaseAuth

class AuthService {
    
    @Published var userSession : FirebaseAuth.User? // FirebaseAuth에 등록된 유저인지 확인하는 기능.
    @Published var currentUser : User?
    
    static let shared = AuthService()
    
    init(){
        Task { try await loadUserData() }
    }
    
    @MainActor
    func login( withEmail email : String, password : String ) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            Task { try await loadUserData() }
        } catch {
            print("DEBUG : Failed to log in with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser ( email : String, password : String, username : String ) async throws {
        /* EnvironmentObject 가 잘 작동되는 걸 확인을 했으니까 주석처리 !
        print("Email is \(email)")
        print("username is \(username)")
        print("password is \(password)")
         */
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await self.uploadUserdata(uid: result.user.uid, username: username, email: email)
        } catch {
            print("DEBUG : Failed to register user with error \(error.localizedDescription)")
        }
    
        /* async await이 없었으면 이렇게 했어야 했다. 그러므로 UI에게 고마워하자. line by line 하지 않아도 된다.
         Auth.auth().createUser(withEmail: email, password: password) { result, error in
         }
         */
    }
    @MainActor
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        guard let currentUid = userSession?.uid else { return }
        self.currentUser = try await UserService.fetchUser(withUid: currentUid)
    }
    
    
    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
    
    private func uploadUserdata(uid: String, username: String, email : String) async {
        let user = User(id: uid, email: email, username: username)
        self.currentUser = user
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
    
}
