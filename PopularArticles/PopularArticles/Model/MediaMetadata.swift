//
//  MediaMetadata.swift
//  PopularArticles
//
//  Created by Salman Qureshi on 11/17/18.
//  Copyright © 2018 Salman Qureshi. All rights reserved.
//

import Foundation

class MediaMetadata: Decodable {
    
    let url: String
    let format: String
    
    private enum CodingKeys: String, CodingKey {
        case url, format
    }
}
