<p align="center">
    <img src="https://img.shields.io/cocoapods/v/Remote.svg?style=flat" />
    <img src="https://img.shields.io/badge/platform-iOS%2010%2B-blue.svg?style=flat" alt="Platform: iOS 10+" />
    <a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat" alt="Language: Swift 4.0" /></a>
    <img src="http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat" alt="License: MIT" />
    <a href="https://github.com/Carthage/Carthage"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" alt="Carthage compatible" /></a>
    <a href="https://twitter.com/dev4jam"><img src="http://img.shields.io/badge/contact-@dev4jam-blue.svg?style=flat"/></a>
    <a href="https://img.shields.io/twitter/follow/espadrine.svg?style=social&label=Follow"</a>
</p>

# Remote

Remote is a highly decoupled/isolated and testable networking layer written in Swift.

## Features

- Simple and customizable implementation
- Easy to integrate and use
- Clean and Neat implementation (SOLID principles)
- Based on pure NSURLSession with no obscured code
- Flexible response parser
- Swift4 Codable/Decodable protocols oriented

## Architecture Design

Current version is based upon the network architecture design described in:

- Atlas networking layer: [link](https://medium.com/iquii/atlas-an-unified-approach-to-mobile-development-cycle-networking-layer-a5ccb064181a)
- The complete guide to Network Unit Testing in Swift: [link](https://medium.com/flawless-app-stories/the-complete-guide-to-network-unit-testing-in-swift-db8b3ee2c327)
- Network Layers in Swift: [link](http://danielemargutti.com/2017/09/10/how-to-write-networking-layer-in-swift-2nd-version/)
- Ultimate Guide to JSON Parsing with Swift 4: [link](https://benscheirman.com/2017/06/swift-json/)
- Under the hood of Futures & Promises in Swift [link](https://www.swiftbysundell.com/posts/under-the-hood-of-futures-and-promises-in-swift)
- This version has migrated use of Promises to using async/await and as such requires at least iOS v13 (however I have up'ed the supported runtime to v17 for iOS, v15 for macOS and v13 for tvOS to ensure the latest Swift 6 featureset can be utilised.)

## Used Libraries

In order to give a complete out-of-box approach I’ve used the following libraries:

* **Reactive Programming in Swift**: As a callback hell solution [RxSwift](https://github.com/ReactiveX/RxSwift)
* **Realm**: Caching [realm.io](https://realm.io)

## Installation
You can install Swiftline using carthage and Swift package manager

### Carthage
```
github 'dementeddevil/Remote'
```

### Swift Package Manager
Add swiftline as dependency in your `Package.swift`

```
import PackageDescription

let package = Package(name: "YourPackage",
dependencies: [
    .Package(url: "https://github.com/dementeddevil/Remote.git", majorVersion: 0),
  ]
)
```

<a name="requirements" />
