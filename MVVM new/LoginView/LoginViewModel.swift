//
//  LoginViewModel.swift
//  MVVM new
//
//  Created by Дмитрий Пономарев on 25.05.2023.
//

import Foundation

enum Result {
    case success(Bool)
    case failure(Bool)
}

final class LoginViewModel {
    
    var result: ObservableObject<Result?> = ObservableObject(value: nil)
    
    func login(email: String, password: String) {
        NetworkService.shared.login(email: email, password: password) { [weak self] (succes) in
            switch succes {
            case true: self?.result.value = .success(true)
            case false: self?.result.value = .failure(false)
            }
        }
    }
}
