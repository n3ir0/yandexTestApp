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

class DataService {
    static let shared = DataService()
    private init() {
    }
    
    let urlDict = Bundle.main.infoDictionary!["EndPoints"] as! [String: String]
    var selectedImageLoadingFramework = ImageLoadingFramework.SDWebImage
    
    func getProductList(completionHandler: @escaping (_ data: [Restaurant], _ responseStatus:  Int?, _ error: Error?) ->()) {
        guard let url = urlDict["getRestaurants"] else {return}
        var data = [Restaurant]()
        var jsonData = JSON()
        var rawData = Data()
        
        Alamofire.request(url, method: .get).validate().responseJSON { (response) in
            let responseStatus = response.response?.statusCode
            switch response.result {
            case .success:
                jsonData = JSON(response.result.value ?? JSON())
                //print("jsonData: \(jsonData)")
                print(jsonData["payload"]["foundPlaces"])
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
}
