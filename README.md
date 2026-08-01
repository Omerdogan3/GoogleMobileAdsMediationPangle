# Google Mobile Ads Mediation — Pangle (vendored)

Local SPM package that links the official Pangle adapter + PAGAdSDK **without**
`TikTokBusinessSDK`, which conflicts with the app's existing
`tiktok/tiktok-business-ios-sdk` SPM dependency (duplicate target name).

Versions pinned to Google's mediation adapter **8.2.0.7.0** /
ByteDance AdsGlobalPackage **8.2.0-release.7**.
