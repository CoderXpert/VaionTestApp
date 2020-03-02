//
//  AddServerPresentable.swift
//  VaionTestApp
//
//  Created by Muhammad Aftab on 02/03/2020.
//  Copyright © 2020 Muhammad Aftab. All rights reserved.
//

protocol AddServerPresentable {
    func startLoading()
    func finishLoading()
    func handle(error: AddServerError)
    func handleSuccess()
}

final class AddServerPresenter: AddServerPresentable {
    
    private var viewController: AlertServerViewControllerType
    
    init(with viewController: AlertServerViewControllerType) {
        self.viewController = viewController
    }
    
    func startLoading() {
        viewController.startLoadingSpinner()
    }
    
    func finishLoading() {
        viewController.stopLoadingSpinner()
    }
    
    func handle(error: AddServerError) {
        switch error {
        case .invalidCredential:
            viewController.presentAuthentication()
        case .hostNotFound, .unhandled:
            viewController.presentAlert(with: error.title, message: error.message)
        }
    }
    
    func handleSuccess() {
        viewController.showConnectedState() // This is not implmented, so will show an alert
        viewController.presentAlert(with: "Success", message: "New server successfully added to the cluster.")
        
    }
}

