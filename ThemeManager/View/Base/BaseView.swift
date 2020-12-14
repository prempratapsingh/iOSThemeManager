//
//  BaseView.swift
//  ThemeManager
//
//  Created by Prem Pratap Singh on 11/12/20.
//

import UIKit

/// Defines  common properties for views  like
/// - Application theming

class BaseView: UIView, Themeable {
  
  var id = UUID().uuidString
  
  var isThemingEnabled: Bool = false {
    didSet(oldValue) {
      guard self.isThemingEnabled != oldValue else { return }
      
      if self.isThemingEnabled == true {
        ThemeManager.shared.addObserver(self)
      } else {
        ThemeManager.shared.removeObserver(self)
      }
    }
  }
  
  /// Calls didReceiveTheme() so that the current application theme is applied to the view
  override func layoutSubviews() {
    self.didReceiveTheme(self.currentTheme)
  }
  
  /// Removes views from the list of registered observers for ThemeManager
  override func removeFromSuperview() {
    self.isThemingEnabled = false
  }
  
  /// This method is called by ThemeManager when the application theme is changed
  func didReceiveTheme(_ theme: Theme) {
    // TO be defined in sub classes
  }
}
