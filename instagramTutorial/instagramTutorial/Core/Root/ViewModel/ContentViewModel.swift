//
//  ContentViewModel.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/23.
//

import Foundation
import Firebase
import Combine


class ContentViewModel : ObservableObject {
    
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var userSession : FirebaseAuth.User?
    
    init(){
        setupSubscribers()
    }
    
    func setupSubscribers() {
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
    }
    
    
}