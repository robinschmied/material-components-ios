// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "MaterialComponents",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Tabs+TabBarView",
            targets: ["Tabs+TabBarView"]
        ),
        .library(
            name: "TextControls+OutlinedTextFields",
            targets: ["TextControls+OutlinedTextFields"]
        ),
        .library(
            name: "TextControls+OutlinedTextFieldsTheming",
            targets: ["TextControls+OutlinedTextFieldsTheming"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/Lilfaen/material-internationalization-ios", branch: "develop"),
        .package(url: "https://github.com/Lilfaen/material-text-accessibility-ios", branch: "develop"),
    ],
    targets: [
        // MARK: Components
        
        .target(
            name: "Tabs+TabBarView",
            dependencies: [
                .target(name: "MaterialComponents/AnimationTiming"),
                .target(name: "MaterialComponents/Ripple"),
                .target(name: "MaterialComponents/private/Math"),
                .product(name: "MDFInternationalization", package: "material-internationalization-ios")
            ],
            path: "components/Tabs/src/TabBarView",
            sources: ["", "private"],
            publicHeadersPath: ""
        ),
        .target(
            name: "TextControls+OutlinedTextFields",
            dependencies: [
                .target(name: "MaterialComponents/Availability"),
                .target(name: "MaterialComponents/TextControls+BaseTextFields"),
                .target(name: "MaterialComponents/private/TextControlsPrivate+OutlinedStyle"),
                
            ],
            path: "components/TextControls/src/OutlinedTextFields",
            sources: ["", "private"],
            publicHeadersPath: ""
        ),
        .target(
            name: "TextControls+OutlinedTextFieldsTheming",
            dependencies: [
                .target(name: "TextControls+OutlinedTextFields"),
                .target(name: "MaterialComponents/schemes/Container"),
            ],
            path: "components/TextControls/src/OutlinedTextFieldsTheming",
            sources: ["", "private"],
            publicHeadersPath: ""
        ),
        
        // MARK: MaterialComponents
        
        .target(
            name: "MaterialComponents/AnimationTiming",
            dependencies: [
            ],
            path: "components/AnimationTiming/src",
            sources: ["", "private"],
            publicHeadersPath: ""
        ),
        .target(
            name: "MaterialComponents/Availability",
            dependencies: [
            ],
            path: "components/Availability/src",
            publicHeadersPath: ""
        ),
        .target(
            name: "MaterialComponents/Ripple",
            dependencies: [
                .target(name: "MaterialComponents/AnimationTiming"),
                .target(name: "MaterialComponents/Availability"),
                .target(name: "MaterialComponents/private/Color"),
                .target(name: "MaterialComponents/private/Math"),
                
            ],
            path: "components/Ripple/src",
            sources: ["", "private"],
            publicHeadersPath: ""
        ),
        .target(
            name: "MaterialComponents/ShadowElevations",
            dependencies: [
            ],
            path: "components/ShadowElevations/src",
            publicHeadersPath: ""
        ),
        .target(
            name: "MaterialComponents/ShadowLayer",
            dependencies: [
                .target(name: "MaterialComponents/ShadowElevations"),
            ],
            path: "components/ShadowLayer/src",
            publicHeadersPath: ""
        ),
        .target(
            name: "MaterialComponents/ShapeLibrary",
            dependencies: [
                .target(name: "MaterialComponents/Shapes"),
                .target(name: "MaterialComponents/private/Math"),
            ],
            path: "components/ShapeLibrary/src",
            publicHeadersPath: ""
        ),
        .target(
            name: "MaterialComponents/Shapes",
            dependencies: [
                .target(name: "MaterialComponents/ShadowLayer"),
                .target(name: "MaterialComponents/private/Color"),
                .target(name: "MaterialComponents/private/Math"),
            ],
            path: "components/Shapes/src",
            publicHeadersPath: ""
        ),
        .target(
            name: "MaterialComponents/TextControls+BaseTextFields",
            dependencies: [
                .target(name: "MaterialComponents/private/TextControlsPrivate+Shared"),
                .target(name: "MaterialComponents/private/TextControlsPrivate+BaseStyle"),
                .target(name: "MaterialComponents/private/TextControlsPrivate+TextFields"),
            ],
            path: "components/TextControls/src/BaseTextFields",
            sources: ["", "private"],
            publicHeadersPath: ""
        ),
        .target(
            name: "MaterialComponents/TextControls+Enums",
            dependencies: [
            ],
            path: "components/TextControls/src/Enums",
            publicHeadersPath: ""
        ),
        .target(
            name: "MaterialComponents/Typography",
            dependencies: [
                .target(name: "MaterialComponents/private/Application"),
                .target(name: "MaterialComponents/private/Math"),
                .product(name: "MDFTextAccessibility", package: "material-text-accessibility-ios"),
            ],
            path: "components/Typography/src",
            sources: ["", "private"],
            publicHeadersPath: ""
        ),
        
        // MARK: MaterialComponents/private
        
        .target(
            name: "MaterialComponents/private/Application",
            dependencies: [
            ],
            path: "components/private/Application/src",
            publicHeadersPath: ""
        ),
        .target(
            name: "MaterialComponents/private/Color",
            dependencies: [
                .target(name: "MaterialComponents/Availability"),
            ],
            path: "components/private/Color/src",
            publicHeadersPath: ""
        ),
        .target(
            name: "MaterialComponents/private/Math",
            dependencies: [
            ],
            path: "components/private/Math/src",
            publicHeadersPath: ""
        ),
        .target(
            name: "MaterialComponents/private/TextControlsPrivate+Shared",
            dependencies: [
                .target(name: "MaterialComponents/TextControls+Enums"),
                .target(name: "MaterialComponents/AnimationTiming"),
                .target(name: "MaterialComponents/private/Math"),
            ],
            path: "components/private/TextControlsPrivate/src/Shared",
            publicHeadersPath: ""
        ),
        .target(
            name: "MaterialComponents/private/TextControlsPrivate+BaseStyle",
            dependencies: [
                .target(name: "MaterialComponents/private/TextControlsPrivate+Shared"),
                .target(name: "MaterialComponents/AnimationTiming"),
                .target(name: "MaterialComponents/private/Math"),
            ],
            path: "components/private/TextControlsPrivate/src/BaseStyle",
            publicHeadersPath: ""
        ),
        .target(
            name: "MaterialComponents/private/TextControlsPrivate+TextFields",
            dependencies: [
                .target(name: "MaterialComponents/private/Math"),
                .target(name: "MaterialComponents/private/TextControlsPrivate+Shared"),
            ],
            path: "components/private/TextControlsPrivate/src/TextFields",
            publicHeadersPath: ""
        ),
        .target(
            name: "MaterialComponents/private/TextControlsPrivate+OutlinedStyle",
            dependencies: [
                .target(name: "MaterialComponents/Availability"),
                .target(name: "MaterialComponents/AnimationTiming"),
                .target(name: "MaterialComponents/private/Math"),
                .target(name: "MaterialComponents/private/TextControlsPrivate+Shared"),
            ],
            path: "components/private/TextControlsPrivate/src/OutlinedStyle",
            publicHeadersPath: ""
        ),
        
        // MARK: MaterialComponents/schemes
        
        .target(
            name: "MaterialComponents/schemes/Container",
            dependencies: [
                .target(name: "MaterialComponents/schemes/Color"),
                .target(name: "MaterialComponents/schemes/Typography"),
                .target(name: "MaterialComponents/schemes/Shape"),
            ],
            path: "components/schemes/Container/src",
            publicHeadersPath: ""
        ),
        .target(
            name: "MaterialComponents/schemes/Color",
            dependencies: [
                .target(name: "MaterialComponents/Availability"),
                .target(name: "MaterialComponents/private/Color"),
            ],
            path: "components/schemes/Color/src",
            publicHeadersPath: ""
        ),
        .target(
            name: "MaterialComponents/schemes/Typography",
            dependencies: [
                .target(name: "MaterialComponents/Typography"),
                .target(name: "MaterialComponents/schemes/Typography+BasicFontScheme"),
                .target(name: "MaterialComponents/schemes/Typography+Scheming"),
            ],
            path: "components/schemes/Typography/src",
            publicHeadersPath: ""
        ),
        .target(
            name: "MaterialComponents/schemes/Typography+BasicFontScheme",
            dependencies: [
            ],
            path: "components/schemes/Typography/src/BasicFontScheme",
            sources: ["", "private"],
            publicHeadersPath: ""
        ),
        .target(
            name: "MaterialComponents/schemes/Typography+Scheming",
            dependencies: [
            ],
            path: "components/schemes/Typography/src/Scheming",
            sources: ["", "private"],
            publicHeadersPath: ""
        ),
        .target(
            name: "MaterialComponents/schemes/Shape",
            dependencies: [
                .target(name: "MaterialComponents/ShapeLibrary"),
                .target(name: "MaterialComponents/Shapes"),
            ],
            path: "components/schemes/Shape/src",
            publicHeadersPath: ""
        ),
    ]
)
