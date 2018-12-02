//
//  UIImageViewExtension.swift
//  yandexTestApp
//
//  Created by Evgeny Gabelev on 02/12/2018.
//  Copyright © 2018 Evgeny Gabelev. All rights reserved.
//

import UIKit
import SDWebImage
import Kingfisher
import Nuke

extension UIImageView {
    func setImage(imageURL: URL?, placeholder: UIImage?) {
        guard let url = imageURL else {
            return
        }
        switch DataService.shared.selectedImageLoadingFramework {
        case ImageLoadingFramework.SDWebImage:
            self.sd_setImage(with: url, placeholderImage: placeholder)
        case ImageLoadingFramework.Kingfisher:
            self.kf.setImage(with: url, placeholder: placeholder)
        case ImageLoadingFramework.Nuke:
            Nuke.loadImage(
                with: url,
                options: ImageLoadingOptions(
                    placeholder: placeholder
                ),
                into: self
            )
        default:
            break
        }
    }
}
