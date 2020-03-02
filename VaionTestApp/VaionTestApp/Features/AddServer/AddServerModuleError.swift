//
//  AddServerModuleError.swift
//  VaionTestApp
//
//  Created by Muhammad Aftab on 02/03/2020.
//  Copyright © 2020 Muhammad Aftab. All rights reserved.
//

import Foundation

enum AddServerError: Int {
    case hostNotFound
    case invalidCredential
    case unhandled
}

extension AddServerError {
    init(with code: Int) {
        switch code {
        case 0: self = .hostNotFound
        case 401: self = .invalidCredential
        default: self = .unhandled
        }
    }
    
    var title: String{
        return "Error"
    }
    
    var message: String {
        switch self {
        case .hostNotFound: return "Host not found, please try again later."
        case .invalidCredential: return "Invalid credential, please try again later."
        case .unhandled: return "Sorry! something went wrong"
        }
    }
}
