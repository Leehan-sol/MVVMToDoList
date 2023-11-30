//
//  AlertManager.swift
//  MVVMToDoList
//
//  Created by t2023-m0048 on 2023/11/30.
//

import UIKit

func showAlertOneButton(on viewController: UIViewController, title: String, message: String?, buttonTitle: String, completion: (() -> Void)? = nil) {
    
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: buttonTitle, style: .default) { _ in
        completion?()
    }
    
    alertController.addAction(action)
    
    viewController.present(alertController, animated: true, completion: nil)
}

func showAlertTwoButton(on viewController: UIViewController,
                        title: String,
                        message: String?,
                        button1Title: String,
                        button2Title: String,
                        completion1: (() -> Void)? = nil) {
    
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action1 = UIAlertAction(title: button1Title, style: .default) { _ in
        completion1?()
    }
    let action2 = UIAlertAction(title: button2Title, style: .cancel)
    
    alertController.addAction(action1)
    alertController.addAction(action2)
    
    viewController.present(alertController, animated: true, completion: nil)
}
