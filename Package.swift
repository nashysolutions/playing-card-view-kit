// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "playing-card-view-kit",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "PlayingCardViewKit",
            targets: ["PlayingCardViewKit"]),
    ],
    targets: [
        .target(
            name: "PlayingCardViewKit"
        )
    ]
)
