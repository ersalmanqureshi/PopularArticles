//
//  Article.swift
//  PopularArticles
//
//  Created by Salman Qureshi on 11/17/18.
//  Copyright © 2018 Salman Qureshi. All rights reserved.
//

import Foundation

struct Article: Decodable {
    let url: String
    let byline: String
    let articleType: String
    let title: String
    let publishDate: String
    let abstract: String
    let adsKeyword: String
    let media: [Media]?
    
    private enum CodingKeys: String, CodingKey {
        case url, byline, articleType = "type", title, publishDate = "published_date", abstract, adsKeyword = "adx_keywords", media
    }
}
