//
//  Place.swift
//  yandexTestApp
//
//  Created by Evgeny Gabelev on 01/12/2018.
//  Copyright © 2018 Evgeny Gabelev. All rights reserved.
//

import Foundation

struct Place: Codable {
    var name: String?
    var description : String?
    var picture = Picture()
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case description = "footerDescription"
        case picture = "picture"
    }
    
    mutating func decode(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        picture = (try values.decodeIfPresent(Picture.self, forKey: .picture))!
    }
}
