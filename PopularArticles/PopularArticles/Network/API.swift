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
    static let apiKey = "b6c94499c2dd459d9aa72d581385d951"
    static let baseUrl = "http://api.nytimes.com/svc/"
    static let provider = MoyaProvider<ArtlcesAPI>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    static func getMostPopularArticles(completion: @escaping (([Article]) -> ())) {
        provider.request(.mostViewed) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(ArticleResults.self, from: response.data)
                    completion(results.articles)
                } catch let err{
                    print(err)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
}
