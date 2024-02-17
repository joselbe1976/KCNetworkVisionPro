// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KCNetworkVisionPro",
    platforms: [
           .iOS(.v16),
           .macOS(.v10_15)
       ],
 
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "KCNetworkVisionPro",
            targets: ["KCNetworkVisionPro"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package( url: "https://github.com/evgenyneu/keychain-swift.git", .upToNextMajor(from: "20.0.0")),
    ],
    targets: [
        .target(
            name: "KCNetworkVisionPro",
            dependencies: [
                .product(name: "KeychainSwift", package: "keychain-swift"),
            ]),
        .testTarget(
            name: "KCNetworkVisionProTests",
            dependencies: ["KCNetworkVisionPro"]),
    ]
)
