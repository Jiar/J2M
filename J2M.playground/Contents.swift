//: Playground - noun: a place where people can play

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

//////////////////// Encodable Encode

let article = Article(id: 1, deleted: false, type: .story, title: "标题", text: "内容", authorId: 1, authorName: "Jiar", created: Date().timeIntervalSince1970, comments: [1, 2, 3])

if let json = article.j2m.toJson() {
    print("\n", json, "\n")
}

//////////////////// String Decode

let json2 =
"""
{"deleted":false,"authorId":2,"title":"标题2","text":"内容2","authorName":"Jiar","type":"job","articleId":1,"createTime":1503384985.8531871}
"""

if let article2 = json2.j2m.toModel(type: Article.self) {
    print("\n", article2, "\n")
}

//////////////////// Data Decode

let data3 =
"""
{"deleted":true,"authorId":3,"title":"标题3","authorName":"Jiar","type":"story","articleId":1,"createTime":1503384985.8531871,"comments":[4,5]}
"""
.data(using: .utf8)!

if let article3 = data3.j2m.toModel(type: Article.self) {
    print("\n", article3, "\n")
}
