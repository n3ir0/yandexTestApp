//
//  Restaurant.swift
//  yandexTestApp
//
//  Created by Evgeny Gabelev on 01/12/2018.
//  Copyright © 2018 Evgeny Gabelev. All rights reserved.
//

import Foundation

struct Restaurant: Codable {
    var place = Place()
    
    
    enum CodingKeys: String, CodingKey {
        case place = "place"
        
    }
    
    mutating func decode(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        place = (try values.decodeIfPresent(Place.self, forKey: .place))!
        
    }
}
