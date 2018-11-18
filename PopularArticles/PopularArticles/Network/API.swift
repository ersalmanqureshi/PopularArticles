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
    fileprivate let provider = MoyaProvider<ArtlcesAPI>()
    
    func getMostPopularArticles(completion: @escaping (([Article]?, NetworkingErrors?) -> ())) {
        provider.request(.mostViewed) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(ArticleResults.self, from: response.data)
                    completion(results.articles, nil)
                } catch let err{
                    completion(nil, NetworkingErrors.errorParsingJSON)
                    print(err)
                }
            case let .failure(error):
                
                print(error)
                completion(nil, NetworkingErrors.noInternetConnection)
            }
        }
    }
}

enum NetworkingErrors: Error {
    case errorParsingJSON
    case noInternetConnection
}
