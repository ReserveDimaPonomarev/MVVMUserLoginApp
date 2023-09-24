//
//  ViewController.swift
//  MVVM new
//
//  Created by Дмитрий Пономарев on 25.05.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    private var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindders()
        // Do any additional setup after loading the view.
    }
    
    func setupBindders() {
        viewModel.result.bind { [weak self] result in
            switch result {
            case .success: self?.gotohomePage()
            case .failure: print("invalid credanrinals")
            case .none: break
            }
        }
    }
    
    private func gotohomePage() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "Second") as! SecondViewController
        present(controller, animated: true)
        
    }
    
    @IBAction func loginBtnClicked(_ sender: Any) {
        guard let email = emailField.text,
              let password = passwordField.text else {
            print("print email and password")
            return
        }
        viewModel.login(email: email, password: password)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

