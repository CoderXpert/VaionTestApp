//
//  Router.swift
//  VaionTestApp
//
//  Created by Muhammad Aftab on 02/03/2020.
//  Copyright © 2020 Muhammad Aftab. All rights reserved.
//

import UIKit

enum PresentationStyle {
    case root
    case push
    case present
}

struct Router {
    /// In VIP it can beuse to route from one module to another module.
    static func route(to route: Route, presentationStyle: PresentationStyle, navigationController: UINavigationController) throws {
    }
}
