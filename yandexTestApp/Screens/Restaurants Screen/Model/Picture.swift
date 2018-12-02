//
//  Picture.swift
//  yandexTestApp
//
//  Created by Evgeny Gabelev on 01/12/2018.
//  Copyright © 2018 Evgeny Gabelev. All rights reserved.
//

import Foundation

struct Picture: Codable {
    var uri: String?
    
    enum CodingKeys: String, CodingKey {
        case uri = "uri"
    }
    
    mutating func decode(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        uri = try values.decodeIfPresent(String.self, forKey: .uri)
    }
}
