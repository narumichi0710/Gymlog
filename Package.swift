// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

enum Config: String {
    case Gymlog
    case AppFeature
    case Auth
    case User
    case Body
    case Record
    case Goal
    case Tutorial
    case ColorScheme
    
    var name: String { rawValue }
    var tests: String { "\(name)Tests" }
    var target: Target {
        .target(name: name, dependencies: dependencies)
    }
    var product: Product {
        .library(name: name, targets: [target.name])
    }
    var package: Package { .init(name: name) }
    var dependencies: [Target.Dependency] {
        switch self {
        case .Gymlog:
            return []
        case .AppFeature:
            return [
                "ColorScheme",
                "User",
                "Record",
                "Goal", "Body",
                "Auth", "Tutorial",
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
                .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk"),
            ]
        case .Goal:
            return ["User"]
        case .Auth:
            return [
                "User",
                "Tutorial",
            ]
        default:
            return []
        }
    }
}

var gymlog = Config.Gymlog
var appFeature = Config.AppFeature
var goal = Config.Goal
var colorScheme = Config.ColorScheme
var user = Config.User
var record = Config.Record
var body = Config.Body
var auth = Config.Auth
var tutorial = Config.Tutorial

let package = Package(
    name: gymlog.name,
    platforms: [.iOS(.v16)],
    products: [
        appFeature.product,
        auth.product,
        user.product,
        record.product,
        goal.product,
        body.product,
        tutorial.product,
        colorScheme.product
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk", exact: .init(10, 9, 0)),
    ],
    targets: [
        appFeature.target,
        auth.target,
        user.target,
        record.target,
        goal.target,
        body.target,
        tutorial.target,
        colorScheme.target,
        .testTarget(
            name: gymlog.tests,
            dependencies: appFeature.target.dependencies
        ),
    ]
)
