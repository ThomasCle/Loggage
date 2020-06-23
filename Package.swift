// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "Loggage",
    products: [
        .library(
            name: "Loggage",
            targets: ["Loggage"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Loggage",
            dependencies: [],
            sources: ["Loggage"]),
        .testTarget(
            name: "LoggageTests",
            dependencies: ["Loggage"],
            sources: ["LoggageTests"]),
    ]
)
