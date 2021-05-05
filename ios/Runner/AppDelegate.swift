import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        let sharedSuiteName: String = "PUT APP GROUP HERE"
        let sharedDataKey: String = "SharedData"
        
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        let methodChannel = FlutterMethodChannel(name: "PUT BUNDLE ID HERE", binaryMessenger: controller.binaryMessenger)
        
        methodChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            if call.method == "getSharedData" {
                if let prefs = UserDefaults(suiteName: sharedSuiteName) {
                    if let sharedText = prefs.string(forKey: sharedDataKey) {
                        result(sharedText);
                    }
                    // clear out the chached data
                    prefs.set("", forKey: sharedDataKey)
                }
            }
        })
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
