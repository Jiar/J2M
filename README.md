<p align="center">

<img src="https://raw.githubusercontent.com/Jiar/J2M/master/Logo/logo.png" alt="J2M" title="J2M" width="642" height="203"/>

</p>

<p align="center">
<a href="https://github.com/Jiar/J2M"><img src="https://img.shields.io/badge/language-swift-orange.svg"></a>
<a href="https://travis-ci.org/Jiar/J2M"><img src="https://img.shields.io/travis/Jiar/J2M/master.svg"></a>
<a href="https://github.com/Jiar/J2M"><img src="https://img.shields.io/cocoapods/v/J2M.svg?style=flat"></a>
<a href="https://github.com/Jiar/J2M/blob/master/LICENSE"><img src="https://img.shields.io/cocoapods/l/J2M.svg?style=flat"></a>
<a href="https://github.com/Jiar/J2M"><img src="https://img.shields.io/cocoapods/p/J2M.svg?style=flat"></a>
<a href="https://codebeat.co/projects/github-com-jiar-j2m-master"><img alt="codebeat badge" src="https://codebeat.co/badges/2a9871ed-7c22-4a24-8267-d52499ee7ff9" /></a>
<a href="http://weibo.com/Jiar"><img src="https://img.shields.io/badge/weibo-@Jiar-red.svg"></a>
<a href="http://twitter.com/JiarYoo"><img src="https://img.shields.io/badge/twitter-@JiarYoo-blue.svg"></a>
</p>

J2M is the json and model transformation framework that is implemented based on the Codable protocol of swift4.

## Requirements

- iOS 8.0+ / macOS 10.9+ / tvOS 9.0+
- Xcode 9.0+
- Swift 4.0+

## Installation

### CocoaPods

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
  pod 'J2M', '~> 1.1.0'
end
```

## Example

### Import:
```Swift
import J2M
```

### Model:
```Swift
struct Article: Codable {

  enum `Type`: String, Codable {
    case story = "story"
    case job   = "job"
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
```

### Encodable Encode:
```Swift
let article = Article(id: 1, deleted: false, type: .story, title: "title", text: "content", authorId: 1, authorName: "Jiar", created: Date().timeIntervalSince1970, comments: [1, 2, 3])

if let json = article.j2m.toJson() {
  // {"comments":[1,2,3],"deleted":false,"authorId":1,"title":"title","text":"content","authorName":"Jiar","type":"story","articleId":1,"createTime":1503495092.778208}
  print("\n\(json)\n")
}
```

### String Decode:
```Swift
let json =
  """
  {"deleted":false,"authorId":2,"title":"title2","text":"content2","authorName":"Jiar","type":"job","articleId":1,"createTime":1503384985.8531871}
  """

if let article = json.j2m.toModel(type: Article.self) {
  // Article(id: 1, deleted: false, type: J2M_Demo.Article.Type.job, title: "title2", text: Optional("content2"), authorId: 2, authorName: "Jiar", created: 1503384985.8531871, comments: nil)
  print("\n\(article)\n")
}
```

### Data Decode:
```Swift
let data =
  """
  {"deleted":true,"authorId":3,"title":"title3","authorName":"Jiar","type":"story","articleId":1,"createTime":1503384985.8531871,"comments":[4,5]}
  """
  .data(using: .utf8)!
		
if let article = data.j2m.toModel(type: Article.self) {
  // Article(id: 1, deleted: true, type: J2M_Demo.Article.Type.story, title: "title3", text: nil, authorId: 3, authorName: "Jiar", created: 1503384985.8531871, comments: Optional([4, 5]))
  print("\n\(article)\n")
}
```

## License

J2M is released under the MIT license. See LICENSE for details.

