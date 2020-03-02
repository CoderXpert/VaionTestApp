//
//  ViewController.swift
//  VaionTestApp
//
//  Created by Muhammad Aftab on 02/03/2020.
//  Copyright © 2020 Muhammad Aftab. All rights reserved.
//

import UIKit

protocol AddServerViewControllerProtocol {
    func presentAuthentication()
    func showConnectedState()
}

typealias AlertServerViewControllerType = AddServerViewControllerProtocol & AlertPresenter & ActivityIndicatable

class AddServerViewController: UIViewController {
    private var interactor: AddServerInteractable!
    
    @IBOutlet private var ipAddressTextField: UITextField!
    @IBOutlet internal var activityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let presenter = AddServerPresenter(with: self)
        interactor = AddServerInteractor(with: presenter, networking: Networking.sharedInstance)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let authenticationViewController = segue.destination as? AuthenticationViewController else {
            return
        }
        
        authenticationViewController.delegate = self
        
    }
    
    @IBAction private func connectToServer(_ sender: UIButton) {
        guard let ipAddress = ipAddressTextField.text, !ipAddress.isEmpty else { return }
        interactor.connectToServer(ipAddress, userName: nil, password: nil)
    }
}

extension AddServerViewController: AddServerViewControllerProtocol {
    func presentAuthentication() {
        performSegue(withIdentifier: "presentAuthentication", sender: nil)
    }
    
    func showConnectedState() {
        // This can be used to show connected state
    }
}

extension AddServerViewController: AuthenticationDelegate {
    func authenticationViewControllerCancelInputingCredidentials() {        
        dismiss(animated: true, completion: nil)
    }
    
    func authenticationViewControllerDidFinishInputCredidentials(userName: String, password: String) {
        dismiss(animated: true) {
            guard let ipAddress = self.ipAddressTextField.text, !ipAddress.isEmpty else { return }
            self.interactor.connectToServer(ipAddress, userName: userName, password: password)
        }
    }
}

extension AddServerViewController: ActivityIndicatable {}
extension AddServerViewController: AlertPresenter {}
