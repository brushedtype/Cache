// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Cache",
    platforms: [
        .macOS(.v10_15), .iOS(.v13)
    ],
    products: [
        .library(name: "Cache", targets: ["Cache"]),
    ],
    targets: [
        .target(name: "Cache", path: "Source/Cache"),
        .testTarget(name: "CacheTests", dependencies: ["Cache"], path: "Tests/Cache"),
    ]
)
