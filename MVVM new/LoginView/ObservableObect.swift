//
//  ObservableObect.swift
//  MVVM new
//
//  Created by Дмитрий Пономарев on 25.05.2023.
//

import Foundation

final class ObservableObject<T> {
    
    private var listener: ((T) -> Void)?
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func bind(_ listener: @escaping(T) -> Void) {
        listener(value)
        self.listener = listener
        
    }
}
