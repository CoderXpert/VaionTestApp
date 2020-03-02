//
//  AddServerInteractorTests.swift
//  VaionTestAppTests
//
//  Created by Muhammad Aftab on 02/03/2020.
//  Copyright © 2020 Muhammad Aftab. All rights reserved.
//

import XCTest
@testable import VaionTestApp

class AddServerInteractorTests: XCTestCase {
    var mockPresenter: MockAddServerPresenter!
    
    override func setUp() {
        super.setUp()
        mockPresenter = MockAddServerPresenter()
    }
    
    override func tearDown() {
        mockPresenter = nil
        super.tearDown()
    }
    
    func test_ConnectToServerWithIpAddress_CallsConnectOnNetworking() {
        let mockNetworking = MockNetworking(
            with: NetworkingResponse(
                success: true,
                code: 0,
                message: ""
            )
        )
        
        let interactor = AddServerInteractor(
            with: mockPresenter,
            networking: mockNetworking
        )
        
        interactor.connectToServer("testIp", userName: "test", password: "password")
        XCTAssertTrue(mockNetworking.connectToServerWasCalled)
        XCTAssertEqual("testIp", mockNetworking.ipAddressArg)
        XCTAssertEqual("test", mockNetworking.credentialsArg?.username)
        XCTAssertEqual("password", mockNetworking.credentialsArg?.password)
    }
    
    func test_ConnectToServer_ConnectionError_CallsPresenterHandleSuccess() {
        let mockNetworking = MockNetworking(
            with: NetworkingResponse(
                success: false,
                code: 0,
                message: "host not found"
            )
        )
        
        let interactor = AddServerInteractor(
            with: mockPresenter,
            networking: mockNetworking
        )
        
        interactor.connectToServer("testIp", userName: "test", password: "password")
        XCTAssertTrue(mockPresenter.handleErrorWasCalled)
        XCTAssertEqual(mockPresenter.handleErrorArg, AddServerError.hostNotFound)
    }
    
    func test_ConnectToServer_SuccessfullConnection_CallsPresenterHandleSuccess() {
        let mockNetworking = MockNetworking(
            with: NetworkingResponse(
                success: true,
                code: 0,
                message: ""
            )
        )
        
        let interactor = AddServerInteractor(
            with: mockPresenter,
            networking: mockNetworking
        )
        
        interactor.connectToServer("testIp", userName: "test", password: "password")
        XCTAssertTrue(mockPresenter.handleScuccessWasCalled)        
    }
}
