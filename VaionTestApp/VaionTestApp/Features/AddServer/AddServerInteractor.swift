//
//  AddServerInteractor.swift
//  VaionTestApp
//
//  Created by Muhammad Aftab on 02/03/2020.
//  Copyright © 2020 Muhammad Aftab. All rights reserved.
//

protocol AddServerInteractable {
    
}

final class AddServerInteractor: AddServerInteractable {
    let presenter: AddServerPresentable
    let networking: NetworkingProtocol
    
    init(with presenter: AddServerPresentable, networking: NetworkingProtocol) {
        self.presenter = presenter
        self.networking = networking
    }
}
