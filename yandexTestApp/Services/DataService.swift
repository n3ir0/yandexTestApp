//
//  DataService.swift
//  yandexTestApp
//
//  Created by Evgeny Gabelev on 01/12/2018.
//  Copyright © 2018 Evgeny Gabelev. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import SDWebImage
import Kingfisher
import Nuke

class DataService {
    static let shared = DataService()
    private init() {
    }
    
    let urlDict = Bundle.main.infoDictionary!["EndPoints"] as! [String: String]
    var selectedImageLoadingFramework = ImageLoadingFramework.SDWebImage
    
    func getProductList(completionHandler: @escaping (_ data: [Restaurant], _ responseStatus:  Int?, _ error: Error?) ->()) {
        guard let urlPrefix = urlDict["urlPrefix"], let restaurantUrl = urlDict["getRestaurants"] else {return}
        let restaurantUrlWithLocation = String(format: restaurantUrl, "\(Location.latitude)", "\(Location.longitude)")
        let url = urlPrefix + restaurantUrlWithLocation
        var data = [Restaurant]()
        var jsonData = JSON()
        var rawData = Data()
        
        Alamofire.request(url, method: .get).validate().responseJSON { (response) in
            let responseStatus = response.response?.statusCode
            switch response.result {
            case .success:
                jsonData = JSON(response.result.value ?? JSON())
                do {
                    rawData = try jsonData["payload"]["foundPlaces"].rawData()
                } catch (let error) {
                    completionHandler(data, responseStatus, error)
                }
                
                do {
                    data = try JSONDecoder().decode([Restaurant].self, from: rawData)
                } catch (let error) {
                    completionHandler(data, responseStatus, error)
                }
                
            case .failure(let error):
                completionHandler(data, responseStatus, error)
            }
            completionHandler(data, responseStatus, response.result.error)
        }
    }
    
    func makeImageUrl(urlToFix: String) -> String {
        guard let urlPrefix = urlDict["urlPrefix"] else {return ""}
        let imageUrl = urlToFix.replacingOccurrences(of: "{w}x{h}", with: "\(Int(RestaurantListImageSize.width))x\(Int(RestaurantListImageSize.height))")
        return urlPrefix + imageUrl
    }
    
    func clearCache() {
        SDImageCache.shared().clearMemory()
        SDImageCache.shared().clearDisk()
        KingfisherManager.shared.cache.clearDiskCache()
        KingfisherManager.shared.cache.clearMemoryCache()
        ImageCache.shared.removeAll()
    }
}
