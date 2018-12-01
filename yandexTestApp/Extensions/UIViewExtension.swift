//
//  UIViewExtension.swift
//  Orbix
//
//  Created by Evgeny Gabelev on 23/11/2018.
//  Copyright © 2018 Orbix GmbH. All rights reserved.
//

import UIKit

extension UIView {
    static var stringID = [UIView: String]()
    static var intID = [UIView: Int]()
    
    var stringID: String? {
        get {
            return UIView.stringID[self]
        }
        set {
            UIView.stringID[self] = newValue
        }
    }
    
    var intID: Int? {
        get {
            return UIView.intID[self]
        }
        set {
            UIView.intID[self] = newValue
        }
    }
}
