//
//  LoadingIndicator.swift
//  Orbix
//
//  Created by Evgeny Gabelev on 13/11/2018.
//  Copyright © 2018 Orbix GmbH. All rights reserved.
//

import UIKit

class LoadingIndicator {
    static let shared = LoadingIndicator()
    private init() {
    }
    
    let blackView = UIView()
    var loadingIndicator = UIActivityIndicatorView()
    
    func start() {
        if let window = UIApplication.shared.keyWindow {
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.3)
            window.addSubview(blackView)
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
            }, completion: nil)
            
            window.addSubview(loadingIndicator)
            loadingIndicator.center = window.center
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
            loadingIndicator.startAnimating()
        }
    }
    
    func stop() {
        loadingIndicator.stopAnimating()
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
        }
    }
}
