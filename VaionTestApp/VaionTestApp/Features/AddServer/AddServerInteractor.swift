//
//  AddServerInteractor.swift
//  VaionTestApp
//
//  Created by Muhammad Aftab on 02/03/2020.
//  Copyright © 2020 Muhammad Aftab. All rights reserved.
//

import Foundation

protocol AddServerInteractable {
    func connectToServer(_ ipAddress: String, userName: String?, password: String?)
}

final class AddServerInteractor: AddServerInteractable {
    let presenter: AddServerPresentable
    let networking: NetworkingProtocol
    
    init(with presenter: AddServerPresentable, networking: NetworkingProtocol) {
        self.presenter = presenter
        self.networking = networking
    }
    
    func connectToServer(_ ipAddress: String, userName: String?, password: String?) {
        presenter.startLoading()
        
        var credidentials: Credentials?
        if let userName = userName, let password = password {
            credidentials = Credentials(username: userName, password: password)
        }
        
        networking.connectToServer(
            ipAddress: ipAddress,
            credentials: credidentials,
            completionHandler: handleResponse(_:)
        )
    }
    
    private func handleResponse(_ networkResponse: NetworkingResponse) {
        presenter.finishLoading()
        networkResponse.success ?
            presenter.handleSuccess() :
            presenter.handle(error: AddServerError(with: networkResponse.code))
    }
}
