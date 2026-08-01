// swift-tools-version:5.6
import PackageDescription

/// Vendored Pangle AdMob mediation adapter.
/// Omits AdsGlobalPackage's TikTokBusinessSDK binary target to avoid SPM
/// target-name conflicts with tiktok-business-ios-sdk.
let package = Package(
  name: "PangleAdapter",
  platforms: [.iOS(.v13)],
  products: [
    .library(
      name: "PangleAdapterTarget",
      targets: ["PangleAdapterTarget"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
      from: "13.6.0"
    ),
  ],
  targets: [
    .target(
      name: "PangleAdapterTarget",
      dependencies: [
        .target(name: "PangleAdapter"),
        .target(name: "AdsGlobalPackage"),
        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
      ],
      path: "PangleAdapterTarget"
    ),
    .target(
      name: "AdsGlobalPackage",
      dependencies: [
        .target(name: "PAGAdSDK"),
      ],
      path: "Sources/AdsGlobalPackage",
      resources: [.copy("PAGAdSDK.bundle")],
      linkerSettings: [
        .linkedFramework("UIKit"),
        .linkedFramework("WebKit"),
        .linkedFramework("MediaPlayer"),
        .linkedFramework("AdSupport"),
        .linkedFramework("CoreMedia"),
        .linkedFramework("AVFoundation"),
        .linkedFramework("CoreTelephony"),
        .linkedFramework("StoreKit"),
        .linkedFramework("SystemConfiguration"),
        .linkedFramework("MobileCoreServices"),
        .linkedFramework("CoreMotion"),
        .linkedFramework("Accelerate"),
        .linkedFramework("AudioToolbox"),
        .linkedFramework("JavaScriptCore"),
        .linkedFramework("CoreGraphics"),
        .linkedFramework("Security"),
        .linkedFramework("DeviceCheck"),
        .linkedFramework("CoreML"),
        .linkedFramework("AppTrackingTransparency"),
        .linkedLibrary("z"),
        .linkedLibrary("resolv"),
        .linkedLibrary("sqlite3"),
        .linkedLibrary("bz2"),
        .linkedLibrary("xml2"),
        .linkedLibrary("iconv"),
        .linkedLibrary("c++abi"),
        .linkedLibrary("c++"),
      ]
    ),
    .binaryTarget(
      name: "PAGAdSDK",
      url: "https://sf16-fe-tos-sg.i18n-pglstatp.com/obj/pangle-sdk-static-va/8.2.0.7/PAGAdSDK.xcframework.zip",
      checksum: "016a6c586e5d09d46dfad89ef1ce38d851e65f2cc13f0e45e21ed3efd763a1bb"
    ),
    .binaryTarget(
      name: "PangleAdapter",
      url: "https://dl.google.com/googleadmobadssdk/mediation/ios/pangle/PangleAdapter-8.2.0.7.0.zip",
      checksum: "9ae12b62730e35cd886c4cfe7ad2922123e17cf3971d7834e2eb5512b0018f40"
    ),
  ]
)
