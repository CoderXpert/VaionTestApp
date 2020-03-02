//
//  MockNetworking.swift
//  VaionTestAppTests
//
//  Created by Muhammad Aftab on 02/03/2020.
//  Copyright © 2020 Muhammad Aftab. All rights reserved.
//

@testable import VaionTestApp

final class MockNetworking: NetworkingProtocol {
    /// Spy
    var connectToServerWasCalled = false
    var ipAddressArg: String?
    var credentialsArg: Credentials?
    
    /// Stub
    let networkResponse: NetworkingResponse
    
    init(with stubNetworkResponse: NetworkingResponse) {
        self.networkResponse = stubNetworkResponse
    }
    
    func connectToServer(ipAddress: String, credentials: Credentials?, completionHandler: @escaping (NetworkingResponse) -> Void) {
        connectToServerWasCalled = true
        ipAddressArg = ipAddress
        credentialsArg = credentials
        
        completionHandler(networkResponse)
    }
    
    func getServerGroups(completionHandler: @escaping ([ServerGroup]) -> Void) throws {
        // Not implemented
    }
    
    func configureServer(name: String, serverGroupName: String?, newServerGroup: ServerGroup?, completionHandler: @escaping (NetworkingResponse) -> Void) throws {
        // Not implemented
    }
}
