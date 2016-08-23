//
//  Watch.swift
//  ReactNativeWithWatch
//

import Foundation
import WatchConnectivity

@objc(Watch)
class Watch : NSObject {
  
  @objc func sendMessage(title: String, body:String) -> Void {
    if (WCSession.isSupported()) {
      let session:WCSession = WCSession.defaultSession()
      session.sendMessage(["title":title, "body":body], replyHandler: nil, errorHandler: nil)
    }
  }
}

