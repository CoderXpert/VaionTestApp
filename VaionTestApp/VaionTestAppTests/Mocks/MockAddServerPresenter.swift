//
//  AddServerPresenterMock.swift
//  VaionTestAppTests
//
//  Created by Muhammad Aftab on 02/03/2020.
//  Copyright © 2020 Muhammad Aftab. All rights reserved.
//

@testable import VaionTestApp

final class MockAddServerPresenter: AddServerPresentable {
    
    var statLoadingWasCalled = false
    var finishLoadingWasCalled = false
    var handleScuccessWasCalled = false
    var handleErrorWasCalled = false
    var handleErrorArg: AddServerError?
    
    func startLoading() {
        statLoadingWasCalled = true
    }
    
    func finishLoading() {
        finishLoadingWasCalled = true
    }
    
    func handle(error: AddServerError) {
        handleErrorWasCalled = true
        handleErrorArg = error
    }
    
    func handleSuccess() {
        handleScuccessWasCalled = true
    }
}

