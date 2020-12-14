//
//  Themeable.swift
//  ThemeManager
//
//  Created by Prem Pratap Singh on 11/12/20.
//

import UIKit

/// Protocol of objects that want to recieve updates about the change in application theme

protocol Themeable {
  
  /// Id is used to uniquly identify thme objects. It helps in identifying if the Themeable object is
  /// already registered as ThemeManager observer for application theme change
  var id: String { get }
  
  /// Current application theme
  var currentTheme: Theme { get }
  
  /// It controls if Themeable object wan't to recieve update about the application theme change
  /// - true: It will be registered as an ThemeManager observer
  /// - false: it will be removed from the ThemeManager observers list
  /// - default: false
  var isThemingEnabled: Bool { get set }
  
  /// This method is called by ThemeManager when the application theme is changed
  func didReceiveTheme(_ theme: Theme)
}

extension Themeable {
  /// Getter for the current application theme
  var currentTheme: Theme {
    return ThemeManager.shared.currentTheme
  }
}
