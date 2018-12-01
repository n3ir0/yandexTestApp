//
//  StackViewExtension.swift
//  MVPAppDT
//
//  Created by Evgeny Gabelev on 14/05/2018.
//  Copyright © 2018 Orbix GmbH. All rights reserved.
//

import UIKit

extension UIView {
    func createStackView(views: [UIView], axis: UILayoutConstraintAxis, distrubution: UIStackViewDistribution, spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = axis
        stackView.distribution = distrubution
        stackView.spacing = spacing
        return stackView
    }
}

