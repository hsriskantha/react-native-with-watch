//
//  InterfaceController.swift
//  WatchApp Extension
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController {

  @IBOutlet var titleLabel: WKInterfaceLabel!
  @IBOutlet var bodyLabel: WKInterfaceLabel!
  
  var titleText: String? {
    didSet {
      titleLabel.setText(titleText)
    }
  }
  
  var bodyText: String? {
    didSet {
      bodyLabel.setText(bodyText)
    }
  }
  
  var session: WCSession? {
    didSet {
      if let session = session {
        session.delegate = self
        session.activateSession();
      }
    }
  }
  
  override func awakeWithContext(context: AnyObject?) {
    super.awakeWithContext(context)
    if (WCSession.isSupported()) {
      session = WCSession.defaultSession()
    }
    
    // Get initial data from React Native
    session?.sendMessage(["action":"get-data"], replyHandler: nil, errorHandler: nil)
  }
}

extension InterfaceController: WCSessionDelegate {
  
  func session(session: WCSession, didReceiveMessage message: [String: AnyObject]) {
    if let title = message["title"] as? String, let body = message["body"] as? String {
      self.titleText = title
      self.bodyText = body
    }
  }
  
}