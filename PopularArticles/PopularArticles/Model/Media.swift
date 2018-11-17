//
//  Media.swift
//  PopularArticles
//
//  Created by Salman Qureshi on 11/17/18.
//  Copyright © 2018 Salman Qureshi. All rights reserved.
//

import Foundation

class Media: Decodable {
    
    let type: String
    let sub_type: String
    let media_metadata: [MediaMetadata]?
    
    private enum CodingKeys: String, CodingKey {
        case type, media_metadata = "media-metadata", sub_type = "subtype"
    }
}
