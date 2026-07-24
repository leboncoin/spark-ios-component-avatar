// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// swiftlint:disable all
let package = Package(
    name: "SparkComponentAvatar",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "SparkComponentAvatar",
            targets: ["SparkComponentAvatar"]
        ),
        .library(
            name: "SparkComponentAvatarTesting",
            targets: ["SparkComponentAvatarTesting"]
        )
    ],
    dependencies: [
       .package(
           url: "https://github.com/leboncoin/spark-ios-common.git",
           // path: "../spark-ios-common"
           /*version*/ "0.0.1"..."999.999.999"
       ),
       .package(
           url: "https://github.com/leboncoin/spark-ios-theming.git",
           // path: "../spark-ios-theming"
           /*version*/ "0.0.1"..."999.999.999"
       ),
       .package(
           url: "https://github.com/leboncoin/spark-ios-component-badge.git",
           // path: "../spark-ios-component-badge"
           /*version*/ "0.0.1"..."999.999.999"
       )
    ],
    targets: [
        .target(
            name: "SparkComponentAvatar",
            dependencies: [
                .product(
                    name: "SparkCommon",
                    package: "spark-ios-common"
                ),
                .product(
                    name: "SparkTheming",
                    package: "spark-ios-theming"
                ),
                .product(
                    name: "SparkComponentBadge",
                    package: "spark-ios-component-badge"
                )
            ],
            path: "Sources/Core"
        ),
        .target(
            name: "SparkComponentAvatarTesting",
            dependencies: [
                "SparkComponentAvatar",
                .product(
                    name: "SparkCommon",
                    package: "spark-ios-common"
                ),
                .product(
                    name: "SparkCommonTesting",
                    package: "spark-ios-common"
                ),
                .product(
                    name: "SparkThemingTesting",
                    package: "spark-ios-theming"
                ),
                .product(
                    name: "SparkTheme",
                    package: "spark-ios-theming"
                )
            ],
            path: "Sources/Testing"
        ),
        .testTarget(
            name: "SparkComponentAvatarUnitTests",
            dependencies: [
                "SparkComponentAvatar",
                "SparkComponentAvatarTesting",
                .product(
                    name: "SparkCommonTesting",
                    package: "spark-ios-common"
                ),
                .product(
                    name: "SparkThemingTesting",
                    package: "spark-ios-theming"
                )
            ],
            path: "Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentAvatarSnapshotTests",
            dependencies: [
                "SparkComponentAvatar",
                "SparkComponentAvatarTesting",
                .product(
                    name: "SparkCommonSnapshotTesting",
                    package: "spark-ios-common"
                ),
            ],
            path: "Tests/SnapshotTests"
        ),
    ]
)
