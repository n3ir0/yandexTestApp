//
//  DataService.swift
//  yandexTestApp
//
//  Created by Evgeny Gabelev on 01/12/2018.
//  Copyright © 2018 Evgeny Gabelev. All rights reserved.
//

import Foundation

class DataService {
    static let shared = DataService()
    private init() {
    }
    
    var selectedImageLoadingFramework = ImageLoadingFramework.SDWebImage
}
