//
//  LayoutExtension.swift
//  MVPAppDT
//
//  Created by Evgeny Gabelev on 14/05/2018.
//  Copyright © 2018 Evgeny Gabelev. All rights reserved.
//

import UIKit


extension UIView {
    
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.topAnchor
        }
        return topAnchor
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.bottomAnchor
        }
        return bottomAnchor
    }
    
    var safeLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.leftAnchor
        }
        return leftAnchor
    }
    
    var safeRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.rightAnchor
        }
        return rightAnchor
    }
    
    func pinHorizontallyInView(_ view: UIView) {
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func pinVerticallyInView(_ view: UIView) {
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func centeredInView(_ view: UIView) {
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func pinToEdges(view: UIView) {
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func pinToEdgesSafely(view: UIView) {
        self.safeTopAnchor.constraint(equalTo: view.safeTopAnchor).isActive = true
        self.safeBottomAnchor.constraint(equalTo: view.safeBottomAnchor).isActive = true
        self.safeLeftAnchor.constraint(equalTo: view.safeLeftAnchor).isActive = true
        self.safeRightAnchor.constraint(equalTo: view.safeRightAnchor).isActive = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func anchor(width: CGFloat, height: CGFloat) {
        self.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: width, height: height)
    }
    
    func anchor(top: NSLayoutYAxisAnchor?,  left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat,  paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat = 0, height: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.safeTopAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let bottom = bottom {
            self.safeBottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let left = left {
            self.safeLeftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let right = right {
            self.safeRightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
