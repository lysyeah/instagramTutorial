//
//  SearchViewModel.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/28.
//

import Foundation

class SearchViewModel : ObservableObject {
    
    @Published var users = [User]()
    
    init(){
        Task { try await fetchALlUsers() }
    }
    
    @MainActor
    func fetchALlUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
    
}
