//
//  AddServerPresentable.swift
//  VaionTestApp
//
//  Created by Muhammad Aftab on 02/03/2020.
//  Copyright © 2020 Muhammad Aftab. All rights reserved.
//

protocol AddServerPresentable {
    
}

final class AddServerPresenter: AddServerPresentable {
    private var viewController: AddServerViewControllerProtocol
    
    init(with viewController: AddServerViewControllerProtocol) {
        self.viewController = viewController
    }
}

