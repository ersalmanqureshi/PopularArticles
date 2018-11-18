//
//  PopularArticlesTests.swift
//  PopularArticlesTests
//
//  Created by Salman Qureshi on 11/17/18.
//  Copyright © 2018 Salman Qureshi. All rights reserved.
//

import XCTest
@testable import PopularArticles
import Moya

class PopularArticlesTests: XCTestCase {
    
    var stubbingProvider: MoyaProvider<ArtlcesAPI>!
    
    let serverErrorEndpointClosure = { (target: ArtlcesAPI) -> Endpoint in
        return Endpoint(url: URL(target: target).absoluteString,
                        sampleResponseClosure: { .networkResponse(200, target.testSampleData) },
                        method: target.method,
                        task: target.task,
                        httpHeaderFields: target.headers)
    }
    
    
    override func setUp() {
        stubbingProvider = MoyaProvider<ArtlcesAPI>(endpointClosure: serverErrorEndpointClosure, stubClosure: MoyaProvider.immediatelyStub)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitialization() {
        
        let article = Article(url: "https://www.nytimes.com/", byline: "By Salman", articleType: "Interactive", title: "Senate Election Results: Republicans Keep Majority", publishDate: "2018-11-06", abstract: "See live U.S. Senate results and maps.", adsKeyword: "2018 Election Results;Midterm Elections (2018)", media: [])
        
        XCTAssertNotNil(article)
        XCTAssertEqual(article.url, "https://www.nytimes.com/")
        XCTAssertEqual(article.publishDate, "2018-11-06")
        XCTAssertEqual(article.articleType, "Interactive")
    }
    
    func testNetwork() {
        let expectation = self.expectation(description: "request")
        _ = stubbingProvider.request(.mostViewed) { res in
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 5.0, handler: nil)
    }
}

extension ArtlcesAPI {
    var testSampleData: Data {
        switch self {
        case .mostViewed:
            let url = Bundle(for: PopularArticlesTests.self).url(forResource: "articles", withExtension: "json")!
            return try! Data(contentsOf: url)
        }
    }
}
