//
//  networkService.swift
//  MVVM new
//
//  Created by Дмитрий Пономарев on 25.05.2023.
//

import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    
    var user: User?
    
    private init() {}
    func login(email: String, password: String, compition: @escaping(Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            if email == "test.com" && password == "password" {
                self?.user = User(name: "me", lastName: "lastme", age: 24, email: "testemail")
                compition(true)
            } else {
                compition(false)
            }
        }
    }
    
    func getloginUser() -> User? {
        return user
    }
}

