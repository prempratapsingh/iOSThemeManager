//
//  BaseViewController.swift
//  ThemeManager
//
//  Created by Prem Pratap Singh on 11/12/20.
//

import UIKit

/// Defines  common properties for view controllers like
/// - Application theming

class BaseViewController: UIViewController, Themeable {
  
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
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.didReceiveTheme(self.currentTheme)
  }
  
  /// Removes view controller from the list of registered observers for ThemeManager
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.isThemingEnabled = false
  }
  
  func didReceiveTheme(_ theme: Theme) {
    // Shold be overridden by sub classes
  }
}
