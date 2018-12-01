//
//  ParametersViewController.swift
//  yandexTestApp
//
//  Created by Evgeny Gabelev on 01/12/2018.
//  Copyright © 2018 Evgeny Gabelev. All rights reserved.
//

import UIKit
import SDWebImage
import Kingfisher
import Nuke

class ParametersViewController: UIViewController {
    
    let frameworkLabel: UILabel = {
        let label = UILabel()
        label.setTextLocalized("frameworkLabelText")
        label.font = UIFont.systemFont(ofSize: FontSize.M)
        label.textAlignment = .center
        label.textColor = UIColor.generalTextColor
        return label
    }()
    
    let sdWebImageCheckBox: DLRadioButton = {
        let checkBox = DLRadioButton(title: "sdWebImageTitle")
        checkBox.stringID = ImageLoadingFramework.SDWebImage
        return checkBox
    }()
    
    let kingfisherCheckBox: DLRadioButton = {
        let checkBox = DLRadioButton(title: "kingfisherTitle")
        checkBox.stringID = ImageLoadingFramework.Kingfisher
        return checkBox
    }()
    
    let nukeCheckBox: DLRadioButton = {
        let checkBox = DLRadioButton(title: "nukeTitle")
        checkBox.stringID = ImageLoadingFramework.Nuke
        return checkBox
    }()
    
    let clearCacheButton: UIButton = {
        let button = UIButton()
        button.setTitleLocalized("clearCacheButtonTitle", for: .normal)
        button.setTitleColor(.clearCacheButtonColor, for: .normal)
        button.setTitleColor(.clearCacheButtonColorHighlighted, for: .highlighted)
        button.addTarget(self, action: #selector(clearCache), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .viewsBackgroundColor
        
        sdWebImageCheckBox.otherButtons = [kingfisherCheckBox, nukeCheckBox]
        sdWebImageCheckBox.isMultipleSelectionEnabled = false
        
        let checkBoxes = [sdWebImageCheckBox, kingfisherCheckBox, nukeCheckBox]
        checkBoxes.forEach { (checkBox) in
            checkBox.isSelected = checkBox.stringID == DataService.shared.selectedImageLoadingFramework
            checkBox.anchor(width: CheckBoxSize.width, height: CheckBoxSize.height)
            checkBox.addTarget(self, action: #selector(checkBoxPressed), for: .touchUpInside)
        }
        
        let checkBoxesStackView = view.createStackView(views: checkBoxes, axis: .vertical, distrubution: .equalSpacing, spacing: 0)
        checkBoxesStackView.alignment = .center
        
        let mainViews = [frameworkLabel, checkBoxesStackView, clearCacheButton]
        let mainStackView = view.createStackView(views: mainViews, axis: .vertical, distrubution: .equalSpacing, spacing: 50)
        mainStackView.alignment = .center
        
        view.addSubview(mainStackView)
        mainStackView.centeredInView(view)
        
    }
    
    @objc func checkBoxPressed(_ sender: DLRadioButton) {
        if let selectedFramework = sender.stringID {
            DataService.shared.selectedImageLoadingFramework = selectedFramework
        }
    }
    
    @objc func clearCache() {
        SDImageCache.shared().clearMemory()
        KingfisherManager.shared.cache.clearDiskCache()
        KingfisherManager.shared.cache.clearMemoryCache()
        ImageCache.shared.removeAll()
    }

}
