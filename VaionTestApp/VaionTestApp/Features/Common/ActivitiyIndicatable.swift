//
//  ActivitiyIndicatable.swift
//  VaionTestApp
//
//  Created by Muhammad Aftab on 02/03/2020.
//  Copyright © 2020 Muhammad Aftab. All rights reserved.
//

import UIKit

protocol ActivityIndicatable {
    var activityIndicatorView: UIActivityIndicatorView! { get }
    func startLoadingSpinner()
    func stopLoadingSpinner()
}

extension ActivityIndicatable {
    func startLoadingSpinner() {
        activityIndicatorView?.startAnimating()
    }
    
    func stopLoadingSpinner() {
        activityIndicatorView?.stopAnimating()
    }
}
