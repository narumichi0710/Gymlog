// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

enum Config: String {
    case Gymlog
    case AppFeature
    
    var name: String { rawValue }
    var tests: String { "\(name)Tests" }
    var target: PackageDescription.Target { .target(name: name) }
    var package: PackageDescription.Package { .init(name: name) }
    
    
}

var gymlog = Config.Gymlog
var appFeature = Config.AppFeature

let package = Package(
    name: gymlog.name,
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: appFeature.name,
            targets: [appFeature.target.name]),
    ],
    targets: [
        .target(name: appFeature.target.name),
        .testTarget(
            name: gymlog.tests,
            dependencies: appFeature.target.dependencies
        ),
    ]
)
