//
//  ArticleResults.swift
//  PopularArticles
//
//  Created by Salman Qureshi on 11/17/18.
//  Copyright © 2018 Salman Qureshi. All rights reserved.
//

import Foundation

struct ArticleResults: Decodable {
    
    let numResults: Double
    let copyright: String
    let articles: [Article]
    
    private enum CodingKeys: String, CodingKey {
        case copyright, numResults = "num_results", articles = "results"
    }
}
