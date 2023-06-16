// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "MaterialComponents",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Tabs_TabBarView",
            targets: ["Tabs_TabBarView"]
        ),
        .library(
            name: "TextControls_OutlinedTextFields",
            targets: ["TextControls+OutlinedTextFields"]
        ),
        .library(
            name: "TextControls_OutlinedTextFieldsTheming",
            targets: ["TextControls+OutlinedTextFieldsTheming"]
        ),
		.library(
			name: "TextControls_OutlinedTextAreas",
			targets: ["TextControls+OutlinedTextAreas"]
		)
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
            name: "Tabs_TabBarView",
            dependencies: [
                .target(name: "MaterialComponents/AnimationTiming"),
                .target(name: "MaterialComponents/Availability"),
                .target(name: "MaterialComponents/Ripple"),
                .target(name: "MaterialComponents/private/Math"),
                .product(name: "MDFInternationalization", package: "material-internationalization-ios")
            ],
            path: "components/Tabs",
            sources: [
                "src/TabBarView"
            ],
            publicHeadersPath: "src/TabBarView"
        ),
        .target(
            name: "TextControls+OutlinedTextFields",
            dependencies: [
                .target(name: "MaterialComponents/Availability"),
                .target(name: "MaterialComponents/TextControls+BaseTextFields"),
                .target(name: "MaterialComponents/private/TextControlsPrivate+OutlinedStyle"),

            ],
            path: "components/TextControls",
            sources: [
                "src/OutlinedTextFields",
            ],
            publicHeadersPath: "src/OutlinedTextFields"
        ),
        .target(
            name: "TextControls+OutlinedTextFieldsTheming",
            dependencies: [
                .target(name: "TextControls+OutlinedTextFields"),
                .target(name: "MaterialComponents/schemes/Container"),
            ],
            path: "components/TextControls",
            sources: [
                "src/OutlinedTextFieldsTheming",
            ],
            publicHeadersPath: "src/OutlinedTextFieldsTheming"
        ),
		.target(
			name: "TextControls+OutlinedTextAreas",
			dependencies: [
				.target(name: "MaterialComponents/Availability"),
				.target(name: "MaterialComponents/TextControls+BaseTextAreas"),
				.target(name: "MaterialComponents/private/TextControlsPrivate+OutlinedStyle"),

			],
			path: "components/TextControls",
			sources: [
				"src/OutlinedTextAreas",
			],
			publicHeadersPath: "src/OutlinedTextAreas"
		),
        
        // MARK: MaterialComponents
        
        .target(
            name: "MaterialComponents/AnimationTiming",
            dependencies: [
            ],
            path: "components/AnimationTiming",
            sources: [
                "src",
            ],
            publicHeadersPath: "src"
        ),
        .target(
            name: "MaterialComponents/Availability",
            dependencies: [
            ],
            path: "components/AvailabilityCompatibility",
            sources: [
                "src",
            ],
            publicHeadersPath: "src"
        ),

        .target(
            name: "MaterialComponents/Ripple",
            dependencies: [
                .target(name: "MaterialComponents/AnimationTiming"),
                .target(name: "MaterialComponents/Availability"),
                .target(name: "MaterialComponents/private/Color"),
                .target(name: "MaterialComponents/private/Math"),
                
            ],
            path: "components/Ripple",
            sources: [
                "src",
            ],
            publicHeadersPath: "src"
        ),
        .target(
            name: "MaterialComponents/ShadowElevations",
            dependencies: [
            ],
            path: "components/ShadowElevations",
            sources: [
                "src",
            ],
            publicHeadersPath: "src"
        ),
        .target(
            name: "MaterialComponents/ShadowLayer",
            dependencies: [
                .target(name: "MaterialComponents/ShadowElevations"),
            ],
            path: "components/ShadowLayer",
            sources: [
                "src",
            ],
            publicHeadersPath: "src"
        ),
        .target(
            name: "MaterialComponents/ShapeLibrary",
            dependencies: [
                .target(name: "MaterialComponents/Shapes"),
                .target(name: "MaterialComponents/private/Math"),
            ],
            path: "components/ShapeLibrary",
            sources: [
                "src",
            ],
            publicHeadersPath: "src"
        ),
        .target(
            name: "MaterialComponents/Shapes",
            dependencies: [
                .target(name: "MaterialComponents/ShadowLayer"),
                .target(name: "MaterialComponents/private/Color"),
                .target(name: "MaterialComponents/private/Math"),
            ],
            path: "components/Shapes",
            sources: [
                "src",
            ],
            publicHeadersPath: "src"
        ),
        .target(
            name: "MaterialComponents/TextControls+BaseTextFields",
            dependencies: [
                .target(name: "MaterialComponents/private/TextControlsPrivate+Shared"),
                .target(name: "MaterialComponents/private/TextControlsPrivate+BaseStyle"),
                .target(name: "MaterialComponents/private/TextControlsPrivate+TextFields"),
                .product(name: "MDFInternationalization", package: "material-internationalization-ios"),
            ],
            path: "components/TextControls",
            sources: [
                "src/BaseTextFields",
            ],
            publicHeadersPath: "src/BaseTextFields"
        ),
		.target(
			name: "MaterialComponents/TextControls+BaseTextAreas",
			dependencies: [
				.target(name: "MaterialComponents/private/TextControlsPrivate+Shared"),
				.target(name: "MaterialComponents/private/TextControlsPrivate+BaseStyle"),
				.target(name: "MaterialComponents/private/TextControlsPrivate+TextAreas"),
				.product(name: "MDFInternationalization", package: "material-internationalization-ios"),
			],
			path: "components/TextControls",
			sources: [
				"src/BaseTextAreas",
			],
			publicHeadersPath: "src/BaseTextAreas"
		),
        .target(
            name: "MaterialComponents/TextControls+Enums",
            dependencies: [
            ],
            path: "components/TextControls",
            sources: [
                "src/Enums",
            ],
            publicHeadersPath: "src/Enums"
        ),
        .target(
            name: "MaterialComponents/Typography",
            dependencies: [
                .target(name: "MaterialComponents/private/Application"),
                .target(name: "MaterialComponents/private/Math"),
                .product(name: "MDFTextAccessibility", package: "material-text-accessibility-ios"),
            ],
            path: "components/Typography",
            sources: [
                "src",
            ],
            publicHeadersPath: "src"
        ),
        
        // MARK: MaterialComponents/private
        
        .target(
            name: "MaterialComponents/private/Application",
            dependencies: [
            ],
            path: "components/private/Application",
            sources: [
                "src",
            ],
            publicHeadersPath: "src"
        ),
        .target(
            name: "MaterialComponents/private/Color",
            dependencies: [
                .target(name: "MaterialComponents/Availability"),
            ],
            path: "components/private/Color",
            sources: [
                "src",
            ],
            publicHeadersPath: "src"
        ),
        .target(
            name: "MaterialComponents/private/Math",
            dependencies: [
            ],
            path: "components/private/Math",
            sources: [
                "src",
            ],
            publicHeadersPath: "src"
        ),
        .target(
            name: "MaterialComponents/private/TextControlsPrivate+Shared",
            dependencies: [
                .target(name: "MaterialComponents/TextControls+Enums"),
                .target(name: "MaterialComponents/AnimationTiming"),
                .target(name: "MaterialComponents/private/Math"),
            ],
            path: "components/private/TextControlsPrivate",
            sources: [
                "src/Shared",
            ],
            publicHeadersPath: "src/Shared"
        ),
        .target(
            name: "MaterialComponents/private/TextControlsPrivate+BaseStyle",
            dependencies: [
                .target(name: "MaterialComponents/private/TextControlsPrivate+Shared"),
                .target(name: "MaterialComponents/AnimationTiming"),
                .target(name: "MaterialComponents/private/Math"),
            ],
            path: "components/private/TextControlsPrivate",
            sources: [
                "src/BaseStyle",
            ],
            publicHeadersPath: "src/BaseStyle"
        ),
        .target(
            name: "MaterialComponents/private/TextControlsPrivate+TextFields",
            dependencies: [
                .target(name: "MaterialComponents/private/Math"),
                .target(name: "MaterialComponents/private/TextControlsPrivate+Shared"),
            ],
            path: "components/private/TextControlsPrivate",
            sources: [
                "src/TextFields",
            ],
            publicHeadersPath: "src/TextFields"
        ),
		.target(
			name: "MaterialComponents/private/TextControlsPrivate+TextAreas",
			dependencies: [
				.target(name: "MaterialComponents/private/Math"),
				.target(name: "MaterialComponents/private/TextControlsPrivate+Shared"),
			],
			path: "components/private/TextControlsPrivate",
			sources: [
				"src/TextAreas",
			],
			publicHeadersPath: "src/TextAreas"
		),
        .target(
            name: "MaterialComponents/private/TextControlsPrivate+OutlinedStyle",
            dependencies: [
                .target(name: "MaterialComponents/Availability"),
                .target(name: "MaterialComponents/AnimationTiming"),
                .target(name: "MaterialComponents/private/Math"),
                .target(name: "MaterialComponents/private/TextControlsPrivate+Shared"),
            ],
            path: "components/private/TextControlsPrivate",
            sources: [
                "src/OutlinedStyle",
            ],
            publicHeadersPath: "src/OutlinedStyle"
        ),
        
        // MARK: MaterialComponents/schemes
        
        .target(
            name: "MaterialComponents/schemes/Container",
            dependencies: [
                .target(name: "MaterialComponents/schemes/Color"),
                .target(name: "MaterialComponents/schemes/Typography"),
                .target(name: "MaterialComponents/schemes/Shape"),
            ],
            path: "components/schemes/Container",
            sources: [
                "src",
            ],
            publicHeadersPath: "src"
        ),
        .target(
            name: "MaterialComponents/schemes/Color",
            dependencies: [
                .target(name: "MaterialComponents/Availability"),
                .target(name: "MaterialComponents/private/Color"),
            ],
            path: "components/schemes/Color",
            sources: [
                "src",
            ],
            publicHeadersPath: "src"
        ),
        .target(
            name: "MaterialComponents/schemes/Typography",
            dependencies: [
                .target(name: "MaterialComponents/Typography"),
                .target(name: "MaterialComponents/schemes/Typography+BasicFontScheme"),
                .target(name: "MaterialComponents/schemes/Typography+Scheming"),
            ],
            path: "components/schemes/Typography",
            exclude: [
                "src/BasicFontScheme",
                "src/SchemingCompatibility"
            ],
            sources: [
                "src",
            ],
            publicHeadersPath: "src"
        ),
        .target(
            name: "MaterialComponents/schemes/Typography+BasicFontScheme",
            dependencies: [
            ],
            path: "components/schemes/Typography",
            sources: [
                "src/BasicFontScheme",
            ],
            publicHeadersPath: "src/BasicFontScheme"
        ),
        .target(
            name: "MaterialComponents/schemes/Typography+Scheming",
            dependencies: [
            ],
            path: "components/schemes/Typography",
            sources: [
                "src/SchemingCompatibility",
            ],
            publicHeadersPath: "src/SchemingCompatibility"
        ),
        .target(
            name: "MaterialComponents/schemes/Shape",
            dependencies: [
                .target(name: "MaterialComponents/ShapeLibrary"),
                .target(name: "MaterialComponents/Shapes"),
            ],
            path: "components/schemes/Shape",
            sources: [
                "src",
            ],
            publicHeadersPath: "src"
        ),
    ]
)
// .product(name: "MDFInternationalization", package: "material-internationalization-ios"),
// .product(name: "MDFTextAccessibility", package: "material-text-accessibility-ios"),
