// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-ascii-carrier",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "ASCII Carrier",
            targets: ["ASCII Carrier"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-molecules/swift-ascii.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-carrier.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "ASCII Carrier",
            dependencies: [
                .product(name: "ASCII", package: "swift-ascii"),
                .product(name: "Carrier", package: "swift-carrier"),
            ]
        ),
        .testTarget(
            name: "ASCII Carrier Tests",
            dependencies: [
                "ASCII Carrier",
                .product(name: "ASCII", package: "swift-ascii"),
                .product(name: "Carrier", package: "swift-carrier"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
