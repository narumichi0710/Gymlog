// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

enum Config: String {
    case Gymlog
    case AppFeature
    case User
    case Goal
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
            return ["ColorScheme", "User"]
        case .Goal:
            return []
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

let package = Package(
    name: gymlog.name,
    platforms: [.iOS(.v16)],
    products: [
        appFeature.product,
        user.product,
        goal.product,
        colorScheme.product
    ],
    targets: [
        appFeature.target,
        user.target,
        goal.target,
        colorScheme.target,
        .testTarget(
            name: gymlog.tests,
            dependencies: appFeature.target.dependencies
        ),
    ]
)
