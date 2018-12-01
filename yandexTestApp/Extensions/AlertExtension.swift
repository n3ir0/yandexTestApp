//
//  AlertExtension.swift
//  MVPAppDT
//
//  Created by Evgeny Gabelev on 14/05/2018.
//  Copyright © 2018 Evgeny Gabelev. All rights reserved.
//

import UIKit

extension UIViewController {
    struct AlertHolder {
        static var alert = UIAlertController()
    }
    
    func simpleAlert(title: String, message: String, actionTitle: String) {
        let alert = UIAlertController(title: NSLocalizedString(title, comment: ""), message: NSLocalizedString(message, comment: ""), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString(actionTitle, comment: ""), style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func alertWithCompletion(title: String, message: String, actionTitle: String, completion: @escaping () -> ()) {
        let alert = UIAlertController(title: NSLocalizedString(title, comment: ""), message: NSLocalizedString(message, comment: ""), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString(actionTitle, comment: ""), style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            completion()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showUnknownErrorMessage() {
        self.simpleAlert(title: "errorTitle", message: "unknownErrorMessage", actionTitle: "Ok")
    }
    
    func showUnknownErrorMessageWithCompletion(completion: @escaping () -> ()) {
        self.alertWithCompletion(title: "errorTitle", message: "unknownErrorMessage", actionTitle: "Ok", completion: completion)
    }
    
    var alert: UIAlertController {
        get {
            return AlertHolder.alert
        }
        set {
            AlertHolder.alert = newValue
        }
    }
    
    func alertWithTextField(title: String,
                         subtitle: String,
                         actionTitle: String,
                         cancelTitle: String,
                         inputPlaceholder:String? = nil,
                         inputKeyboardType:UIKeyboardType = UIKeyboardType.default,
                         cancelHandler: ((UIAlertAction) -> Swift.Void)? = nil,
                         actionHandler: ((_ text: String?) -> Void)? = nil) {
        alert = UIAlertController(title: title, message: subtitle, preferredStyle: .alert)
        alert.addTextField { (textField:UITextField) in
            textField.placeholder = inputPlaceholder
            textField.keyboardType = inputKeyboardType
            textField.addTarget(self, action: #selector(self.alertTextFieldDidChange), for: .editingChanged)
        }
        alert.addAction(UIAlertAction(title: actionTitle, style: .destructive, handler: { (action:UIAlertAction) in
            guard let textField =  self.alert.textFields?.first else {
                actionHandler?(nil)
                return
            }
            actionHandler?(textField.text)
        }))
        alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelHandler))
        alert.actions[0].isEnabled = false
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func alertTextFieldDidChange(_ sender: UITextView) {
        alert.actions[0].isEnabled = sender.text!.count > 5
    }
}
