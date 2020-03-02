//
//  MockAddServerInteractor.swift
//  VaionTestAppTests
//
//  Created by Muhammad Aftab on 02/03/2020.
//  Copyright © 2020 Muhammad Aftab. All rights reserved.
//

@testable import VaionTestApp

final class MockAddServerInteractor: AddServerInteractable {
    var connectToServerWasCalled = false
    var ipAddressArg: String?
    var userNameArg: String?
    var passwordArg: String?
    
    func connectToServer(_ ipAddress: String, userName: String?, password: String?) {
        connectToServerWasCalled = true
        ipAddressArg = ipAddress
        userNameArg = userName
        passwordArg = password
    }
}
