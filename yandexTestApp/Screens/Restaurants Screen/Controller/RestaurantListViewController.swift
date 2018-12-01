//
//  RestaurantListViewController.swift
//  yandexTestApp
//
//  Created by Evgeny Gabelev on 01/12/2018.
//  Copyright © 2018 Evgeny Gabelev. All rights reserved.
//

import UIKit
import SDWebImage
import Kingfisher
import Nuke

class RestaurantListViewController: UIViewController,
                                    UITableViewDelegate,
                                    UITableViewDataSource {
    
    let restaurantListTableViewCellID = "restaurantListTableViewCellID"
    var restaurantList = [Restaurant]()
    
    let restaurantListTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .viewsBackgroundColor
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantListTableView.dataSource = self
        restaurantListTableView.delegate = self
        restaurantListTableView.register(RestaurantListTableViewCell.self, forCellReuseIdentifier: restaurantListTableViewCellID)
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .viewsBackgroundColor
        view.addSubview(restaurantListTableView)
        restaurantListTableView.pinToEdgesSafely(view: view)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: restaurantListTableViewCellID, for: indexPath) as! RestaurantListTableViewCell
        cell.restaurantNameLabel.text = restaurantList[indexPath.row].place.name
        cell.restaurantDescriptionLabel.text = restaurantList[indexPath.row].place.description
        guard let imageUrl = URL(string: restaurantList[indexPath.row].place.picture.url ?? "") else {return cell}
        let placeholderImage = UIImage(named: "noImage")
        switch DataService.shared.selectedImageLoadingFramework {
        case ImageLoadingFramework.SDWebImage:
            cell.restaurantImageView.sd_setImage(with: imageUrl, placeholderImage: placeholderImage)
        case ImageLoadingFramework.Kingfisher:
            cell.restaurantImageView.kf.setImage(with: imageUrl, placeholder: placeholderImage)
        case ImageLoadingFramework.Nuke:
            Nuke.loadImage(
                with: imageUrl,
                options: ImageLoadingOptions(
                    placeholder: placeholderImage
                ),
                into: cell.restaurantImageView
            )
        default:
            break
        }
        
        return cell
    }
    
    func estimateFrameForText(text: String, fontSize: CGFloat) -> CGRect {
        let height: CGFloat = 2000 //arbitrary large value
        let size = CGSize(width: view.frame.width - 115, height: height)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize)]
        return NSString(string: text).boundingRect(with: size, options: options, attributes: attributes, context: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height: CGFloat = 85
        guard let description = restaurantList[indexPath.row].place.description else {
            return height
        }
        let estimatedHeight = estimateFrameForText(text: description, fontSize: FontSize.S).height
        if estimatedHeight > 80 {
            height = estimatedHeight + 40
        }
        return height
    }
    
    deinit {
        switch DataService.shared.selectedImageLoadingFramework {
        case ImageLoadingFramework.SDWebImage:
            SDImageCache.shared().clearMemory()
        case ImageLoadingFramework.Kingfisher:
            KingfisherManager.shared.cache.clearDiskCache()
            KingfisherManager.shared.cache.clearMemoryCache()
        case ImageLoadingFramework.Nuke:
            ImageCache.shared.removeAll()
        default:
            break
        }
    }
    
    
}
