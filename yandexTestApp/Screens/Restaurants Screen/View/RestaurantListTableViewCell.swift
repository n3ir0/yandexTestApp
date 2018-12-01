//
//  RestaurantListTableViewCell.swift
//  yandexTestApp
//
//  Created by Evgeny Gabelev on 01/12/2018.
//  Copyright © 2018 Evgeny Gabelev. All rights reserved.
//

import UIKit

class RestaurantListTableViewCell: UITableViewCell {

    let restaurantImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "noImage")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.anchor(width: RestaurantListImageSize.width, height: RestaurantListImageSize.height)
        imageView.backgroundColor = .red
        return imageView
    }()
    
    let restaurantNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .generalTextColor
        label.font = UIFont.boldSystemFont(ofSize: FontSize.M)
        label.text = "макдональдс"
        label.textAlignment = .left
        return label
    }()
    
    let restaurantDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .generalTextColor
        label.font = UIFont.systemFont(ofSize: FontSize.S)
        label.textAlignment = .left
        label.text = "макдональдс макдональдс макдональдс макдональдсмакдональдс макдональдс макдональдс макдональдс макдональдс макдональдс макдональдс макдональдс макдональдс макдональдс макдональдс макдональдс макдональдс макдональдс макдональдс макдональдс"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    func setupCell() {
        addSubview(restaurantImageView)
        restaurantImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0)
        
        addSubview(restaurantNameLabel)
        restaurantNameLabel.anchor(top: topAnchor, left: restaurantImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 5)
        
        addSubview(restaurantDescriptionLabel)
        restaurantDescriptionLabel.anchor(top: restaurantNameLabel.bottomAnchor, left: restaurantImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
