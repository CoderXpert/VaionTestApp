//
//  MockViewController.swift
//  VaionTestAppTests
//
//  Created by Muhammad Aftab on 02/03/2020.
//  Copyright © 2020 Muhammad Aftab. All rights reserved.
//

@testable import VaionTestApp
import UIKit

final class MockAddServerViewController: AddServerViewControllerProtocol, ActivityIndicatable, AlertPresenter {
    /// Spy
    var startLoadingSpinnerWasCalled = false
    var stopLoadingSpinnerWasCalled = false
    var presentAuthenticationWasCalled = false
    var showConnectedStateWasCalled = false
    var presentAlertWasCalled = false
    
    var titleArg: String?
    var messageArg: String?
    
    /// Implementation
    var activityIndicatorView: UIActivityIndicatorView! = UIActivityIndicatorView()
    
    func presentAuthentication() {
        presentAuthenticationWasCalled = true
    }
    
    func showConnectedState() {
        showConnectedStateWasCalled = true
    }
    
    func presentAlert(with title: String, message: String) {
        presentAlertWasCalled = true
        titleArg = title
        messageArg = message
    }
    
    func startLoadingSpinner() {
        startLoadingSpinnerWasCalled = true
    }
    
    func stopLoadingSpinner() {
        stopLoadingSpinnerWasCalled = true
    }
}
