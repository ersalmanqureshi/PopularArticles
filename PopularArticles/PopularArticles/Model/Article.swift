//
//  Article.swift
//  PopularArticles
//
//  Created by Salman Qureshi on 11/17/18.
//  Copyright © 2018 Salman Qureshi. All rights reserved.
//

import Foundation

struct Article: Decodable {
    let byline: String
    let articleType: String
    let title: String
    let publishDate: String
    let abstract: String
    
    private enum CodingKeys: String, CodingKey {
        case byline, articleType = "type", title, publishDate = "published_date", abstract
    }
}
