// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Remote",
    platforms: [
        .iOS(.v17),
        .macOS(.v15),
        .tvOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Remote",
            targets: ["Remote"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Remote"),
        .testTarget(
            name: "RemoteTests",
            dependencies: ["Remote"]
        ),
    ]
)
