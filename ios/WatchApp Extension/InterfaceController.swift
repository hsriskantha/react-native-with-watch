//
//  InterfaceController.swift
//  WatchApp Extension
//

import WatchKit
import Foundation


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
  
  override func awakeWithContext(context: AnyObject?) {
    super.awakeWithContext(context)
    titleText = "Morning!"
    bodyText = "How's it going?"
  }
}
