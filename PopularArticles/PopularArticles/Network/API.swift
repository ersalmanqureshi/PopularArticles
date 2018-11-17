//
//  API.swift
//  PopularArticles
//
//  Created by Salman Qureshi on 11/17/18.
//  Copyright © 2018 Salman Qureshi. All rights reserved.
//

import Foundation
import Moya


/*
    "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=sample_key"
 */
struct API {
    static let apiKey = "60aeaeae7fff4477958cfe2a8a6a76f5"
    static let baseUrl = "http://api.nytimes.com/svc/"
    static let provider = MoyaProvider<ArtlcesAPI>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    static func getMostPopularArticles(completion: @escaping (([String: Any]) -> ())) {
        
    }
    
}
