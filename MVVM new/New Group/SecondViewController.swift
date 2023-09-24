//
//  SecondViewController.swift
//  MVVM new
//
//  Created by Дмитрий Пономарев on 25.05.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    let viewModel = SecondViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getloginUser()
        viewModel.welcome.bind { [weak self] (value) in
            guard self?.welcomeLabel.text != nil else { return }
            self!.welcomeLabel.text = value
        }

    }
}

