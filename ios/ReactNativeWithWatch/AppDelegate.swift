//
//  AppDelegate.swift
//  ReactNativeWithWatch
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
    
    var jsCodeLocation:NSURL
    jsCodeLocation = RCTBundleURLProvider.sharedSettings().jsBundleURLForBundleRoot("index.ios", fallbackResource: nil)
    
    let rootView = RCTRootView(bundleURL: jsCodeLocation,
                               moduleName: "ReactNativeWithWatch",
                               initialProperties: nil,
                               launchOptions: launchOptions)
    rootView.backgroundColor = UIColor.whiteColor()
    
    let rootViewController = UIViewController();
    rootViewController.view = rootView
    
    self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
    self.window!.rootViewController = rootViewController
    self.window!.makeKeyAndVisible()
    
    return true
  }
}
