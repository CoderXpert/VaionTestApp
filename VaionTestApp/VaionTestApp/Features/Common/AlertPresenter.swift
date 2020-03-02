//
//  AlertPresenter.swift
//  VaionTestApp
//
//  Created by Muhammad Aftab on 02/03/2020.
//  Copyright © 2020 Muhammad Aftab. All rights reserved.
//

import UIKit

protocol AlertPresenter {
    func presentAlert(with title: String, message: String)
}
extension AlertPresenter where Self: UIViewController {
    func presentAlert(with title: String, message: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(
                title: title,
                message: message,
                preferredStyle: .alert
            )
            alertController.addAction(
                UIAlertAction(
                    title: "Ok",
                    style: .default,
                    handler: nil
                )
            )
            self.present(
                alertController,
                animated: true,
                completion: nil
            )
        }
    }
}
