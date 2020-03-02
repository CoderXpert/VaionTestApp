//
//  Route.swift
//  VaionTestApp
//
//  Created by Muhammad Aftab on 02/03/2020.
//  Copyright © 2020 Muhammad Aftab. All rights reserved.
//

enum Route {
    case addServer
    case authenticate
}

extension Route {
    var identifier: String {
        switch self {
        case .addServer: return "AddServerViewController"
        case .authenticate: return "AuthenticationViewController"
        }
    }
}
