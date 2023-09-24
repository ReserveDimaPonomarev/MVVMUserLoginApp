//
//  HomeViewModel.swift
//  MVVM new
//
//  Created by Дмитрий Пономарев on 26.05.2023.
//

import Foundation

class SecondViewModel {
    
    var welcome: ObservableObject<String?> = ObservableObject(value: nil)
    
    func getloginUser() {
        let user = NetworkService.shared.getloginUser()
        self.welcome.value = "\(user?.name) \(user?.lastName)"
    }
}
