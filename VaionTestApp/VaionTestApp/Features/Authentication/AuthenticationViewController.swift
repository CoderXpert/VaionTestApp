//
//  AuthenticationViewController.swift
//  VaionTestApp
//
//  Created by Muhammad Aftab on 02/03/2020.
//  Copyright © 2020 Muhammad Aftab. All rights reserved.
//

import UIKit

protocol AuthenticationDelegate: AnyObject {
    func authenticationViewControllerDidFinishInputCredidentials(userName: String, password: String)
    func authenticationViewControllerCancelInputingCredidentials()
}

class AuthenticationViewController: UIViewController {
    @IBOutlet private var userNameTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    
    weak var delegate: AuthenticationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func authenticate(_ sender: UIButton) {
        guard
            let userName = userNameTextField.text,
            let password = passwordTextField.text,
            !userName.isEmpty,
            !password.isEmpty else { return }
        
        delegate?.authenticationViewControllerDidFinishInputCredidentials(userName: userName, password: password)
    }
    
    @IBAction private func cancel(_ sender: UIButton) {
        delegate?.authenticationViewControllerCancelInputingCredidentials()
    }
}
