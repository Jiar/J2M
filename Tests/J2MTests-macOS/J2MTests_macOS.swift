//
//  J2MTests_macOS.swift
//  J2MTests-macOS
//
//  Created by Jiar on 2017/8/23.
//  Copyright © 2017年 Jiar. All rights reserved.
//

import XCTest
import J2M

//////////////////// Codable Model

struct Article: Codable {
    
    enum `Type`: String, Codable {
        case story   = "story"
        case job     = "job"
    }
    
    let id: Int
    let deleted: Bool
    let type: Type
    let title: String
    let text: String?
    let authorId: Int
    let authorName: String
    let created: TimeInterval
    let comments: [Int]?
    
    // Key Mapping
    private enum CodingKeys : String, CodingKey {
        case id = "articleId", deleted, type, title, text, authorId, authorName, created = "createTime", comments
    }
    
}

class J2MTests_macOS: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEncodableEncode() {
        let article = Article(id: 1, deleted: false, type: .story, title: "标题", text: "内容", authorId: 1, authorName: "Jiar", created: Date().timeIntervalSince1970, comments: [1, 2, 3])
        XCTAssert(article.j2m.toJson() != nil, "It must not be nil")
    }
    
    func testStringDecode() {
        let json =
            """
            {"deleted":false,"authorId":2,"title":"标题2","text":"内容2","authorName":"Jiar","type":"job","articleId":1,"createTime":1503384985.8531871}
            """
        XCTAssert(json.j2m.toModel(type: Article.self) != nil, "It must not be nil")
    }
    
    func testDataDecode() {
        let data =
            """
            {"deleted":true,"authorId":3,"title":"标题3","authorName":"Jiar","type":"story","articleId":1,"createTime":1503384985.8531871,"comments":[4,5]}
            """
                .data(using: .utf8)!
        XCTAssert(data.j2m.toModel(type: Article.self) != nil, "It must not be nil")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
