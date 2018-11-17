//
//  ArticlesAPI.swift
//  PopularArticles
//
//  Created by Salman Qureshi on 11/17/18.
//  Copyright © 2018 Salman Qureshi. All rights reserved.
//

import Foundation
import Moya

enum ArtlcesAPI {
    case mostViewed
}

extension ArtlcesAPI: TargetType {
    var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var baseURL: URL {
        guard let url = URL(string: API.baseUrl) else {
            fatalError("url not configured")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .mostViewed:
            return "mostpopular/v2/mostviewed/all-sections/7.json"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .mostViewed:
            return URLEncoding.queryString
        }
    }
    
    var task: Task {
        switch self {
        case .mostViewed:
            return .requestParameters(parameters: ["api_key": API.apiKey], encoding: URLEncoding.queryString)
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .mostViewed:
            return ["api_key=": API.apiKey]
        }
    }
}
