//
//  MainViewController.swift
//  yandexTestApp
//
//  Created by Evgeny Gabelev on 01/12/2018.
//  Copyright © 2018 Evgeny Gabelev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "yandexLogo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let restaurantSearchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "restaurantSearchButtonNormal"), for: .normal)
        button.setImage(UIImage(named: "restaurantSearchButtonHighlighted"), for: .highlighted)
        button.addTarget(self, action: #selector(showRestaurantList), for: .touchUpInside)
        return button
    }()
    
    let restaurantSearchButtonLabel: UILabel = {
        let label = UILabel()
        label.setTextLocalized("restaurantSearchButtonLabelText")
        label.textColor = .searchButtonTextColor
        label.textAlignment = .center
        label.sizeToFit()
        label.font = UIFont.boldSystemFont(ofSize: FontSize.SuperXXL)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        return label
    }()
    
    let parametersSearchButton: UIButton = {
        let button = UIButton()
        button.setTitleLocalized("parameterButtonTitle", for: .normal)
        button.setTitleColor(.parametersSearchButtonColor, for: .normal)
        button.setTitleColor(.parametersSearchButtonColorHighlighted, for: .highlighted)
        button.addTarget(self, action: #selector(showParametersSearchScreen), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .viewsBackgroundColor
        let buttonViews = [restaurantSearchButton, parametersSearchButton]
        let buttonStack = view.createStackView(views: buttonViews, axis: .vertical, distrubution: .fillProportionally, spacing: 10)
        
        let views = [logoImageView, buttonStack]
        let viewStack = view.createStackView(views: views, axis: .vertical, distrubution: .fill, spacing: 30)
        
        view.addSubview(viewStack)
        viewStack.anchor(top: view.safeTopAnchor, left: view.safeLeftAnchor, bottom: view.safeBottomAnchor, right: view.safeRightAnchor, paddingTop: 0, paddingLeft: 30, paddingBottom: 50, paddingRight: 30)
        
        view.addSubview(restaurantSearchButtonLabel)
        restaurantSearchButtonLabel.anchor(top: restaurantSearchButton.topAnchor, left: restaurantSearchButton.leftAnchor, bottom: restaurantSearchButton.bottomAnchor, right: restaurantSearchButton.rightAnchor, paddingTop: 0, paddingLeft: 30, paddingBottom: 0, paddingRight: 30)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        restaurantSearchButton.anchor(width: 0, height: restaurantSearchButton.frame.width)
        restaurantSearchButton.layer.cornerRadius = restaurantSearchButton.frame.width / 2
        parametersSearchButton.anchor(width: 0, height: 50)
    }
    
    @objc func showParametersSearchScreen() {
        let parametersScreen = ParametersViewController()
        navigationController?.pushViewController(parametersScreen, animated: true)
    }
    
    @objc func showRestaurantList() {
        
    }
 
}

