//
//  AppDelegate.swift
//  ReactNativeWithWatch
//

import UIKit
import WatchConnectivity

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  var session: WCSession? {
    didSet {
      if let session = session {
        session.delegate = self
        session.activateSession()
      }
    }
  }
  
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
    
    if WCSession.isSupported() {
      session = WCSession.defaultSession()
    }
    
    return true
  }
}

extension AppDelegate: WCSessionDelegate {

  func session(session: WCSession, didReceiveMessage message: [String: AnyObject]) {
    if let action = message["action"] as? String {
      if (action == "get-data") {
        let watch = Watch()
        watch.sendMessage("iPhone says:", body:"Hello")
      }
    }
  }
  
}
