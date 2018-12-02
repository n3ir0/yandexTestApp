//
//  DLRadioButtonExtension.swift
//  yandexTestApp
//
//  Created by Evgeny Gabelev on 01/12/2018.
//  Copyright © 2018 Evgeny Gabelev. All rights reserved.
//

import Foundation

extension DLRadioButton {
    convenience init(title: String?) {
        self.init()
        self.setTitleColor(.radioButtonTextColor, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: FontSize.S)
        self.setTitle(NSLocalizedString(title ?? "", comment: ""), for: .normal)
        self.iconColor = .radioButtonIconColor
        self.indicatorColor = .radioButtonIconColor
        self.anchor(width: 400, height: 50)
        self.isMultipleSelectionEnabled = true
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
    }
}
