//
//  ColorExtension.swift
//  MVPAppDT
//
//  Created by Evgeny Gabelev on 14/05/2018.
//  Copyright © 2018 Evgeny Gabelev. All rights reserved.
//

import UIKit

extension UIColor {
    static let generalTextColor = UIColor(r: 52, g: 52, b: 52, a: 1)
    static let searchButtonTextColor = UIColor(r: 255, g: 255, b: 255, a: 1)
    static let parametersSearchButtonColor = UIColor(r: 52, g: 52, b: 52, a: 1)
    static let parametersSearchButtonColorHighlighted = UIColor(r: 205, g: 205, b: 205, a: 1)
    static let viewsBackgroundColor = UIColor(r: 255, g: 255, b: 255, a: 1)
    static let radioButtonTextColor = UIColor(r: 52, g: 52, b: 52, a: 1)
    static let radioButtonIconColor = UIColor(r: 52, g: 52, b: 52, a: 1)
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}

