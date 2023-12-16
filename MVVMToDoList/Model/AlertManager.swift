//
//  AlertManager.swift
//  MVVMToDoList
//
//  Created by hansol on 2023/12/16.
//

import UIKit

import UIKit

class AlertManager {
    func showAlertWithTF(from viewController: UIViewController,
                         title: String,
                         message: String,
                         tfText: String,
                         button1Title: String,
                         button2Title: String,
                         completion1: ((String) -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = tfText
        }
        
        let action1 = UIAlertAction(title: button1Title, style: .default) { _ in
            if let text = alert.textFields?.first?.text {
                completion1?(text)
            }
        }
        let action2 = UIAlertAction(title: button2Title, style: .cancel)
        
        alert.addAction(action1)
        alert.addAction(action2)
        
        viewController.present(alert, animated: true, completion: nil)
    }
}

