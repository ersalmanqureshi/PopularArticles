//
//  PopularArticlesTests.swift
//  PopularArticlesTests
//
//  Created by Salman Qureshi on 11/17/18.
//  Copyright © 2018 Salman Qureshi. All rights reserved.
//

import XCTest
@testable import PopularArticles

class PopularArticlesTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
}
