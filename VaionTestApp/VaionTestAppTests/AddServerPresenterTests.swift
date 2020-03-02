//
//  AddServerPresenterTests.swift
//  VaionTestAppTests
//
//  Created by Muhammad Aftab on 02/03/2020.
//  Copyright © 2020 Muhammad Aftab. All rights reserved.
//

import XCTest
@testable import VaionTestApp

class AddServerPresenterTests: XCTestCase {
    var mockViewController: MockAddServerViewController!
    var presenter: AddServerPresenter!
    
    override func setUp() {
        super.setUp()
        mockViewController = MockAddServerViewController()
        presenter = AddServerPresenter(with: mockViewController)
    }
    
    override func tearDown() {
        mockViewController = nil
        super.tearDown()
    }
    
    func test_StartLoading_ShouldCallViewControllerStartLoadingSpinner() {
        presenter.startLoading()
        XCTAssertTrue(mockViewController.startLoadingSpinnerWasCalled)
    }
    
    func test_FinishLoading_ShouldCallViewControllerStopSpinner() {
        presenter.finishLoading()
        XCTAssertTrue(mockViewController.stopLoadingSpinnerWasCalled)
    }
    
    func test_HandleError_HostNotFound_ShouldCallPresentAlertWithErrorTitleAndMessage() {
        presenter.handle(error: .hostNotFound)
        XCTAssertTrue(mockViewController.presentAlertWasCalled)
        XCTAssertEqual(mockViewController.titleArg, "Error")
        XCTAssertEqual(mockViewController.messageArg, "Host not found, please try again later.")
    }
    
    func testHandleError_InvalidCredential_CallsViewControllerPresentAuthentication() {
        presenter.handle(error: .invalidCredential)
        XCTAssertTrue(mockViewController.presentAuthenticationWasCalled)
    }
    
    func testHandleSuccess_CallsViewControllerShowConnectedState() {
        presenter.handleSuccess()
        XCTAssertTrue(mockViewController.showConnectedStateWasCalled)
    }
}
