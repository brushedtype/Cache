// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Cache",
    platforms: [
        .macOS(.v10_11), .iOS(.v12), .tvOS(.v9)
    ],
    products: [
        .library(name: "Cache", targets: ["Cache"]),
    ],
    targets: [
        .target(name: "Cache", path: "Source/Shared", exclude: ["Library/ImageWrapper.swift"]),
        .testTarget(name: "CacheTests", dependencies: ["Cache"], path: "Tests"),
    ]
)
