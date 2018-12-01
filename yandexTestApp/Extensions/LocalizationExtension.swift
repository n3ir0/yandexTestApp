//
//  LocalizationExtension.swift
//  yandexTestApp
//
//  Created by Evgeny Gabelev on 01/12/2018.
//  Copyright © 2018 Evgeny Gabelev. All rights reserved.
//

import UIKit

extension UIButton {
    func setTitleLocalized(_ title: String, for state: UIControlState) {
        self.setTitle(NSLocalizedString(title, comment: ""), for: state)
    }
}

extension UILabel {
    func setTextLocalized(_ text: String) {
        self.text = NSLocalizedString(text, comment: "")
    }
}
