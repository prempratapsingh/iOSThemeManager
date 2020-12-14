//
//  ThemeManager.swift
//  ThemeManager
//
//  Created by Prem Pratap Singh on 11/12/20.
//

import Foundation

/// Manager for applcation theming.
/// It maintains a collection of Themeable that are notified when the application theme is changed so that Themeable could
/// apply the updated theme.

class ThemeManager {
  
  /// Singleton instance of ThemeManager
  static let shared = ThemeManager()
  
  /// Current application theme represented by Theme protocol, it is updated when user selects a new theme
  /// The registeered observers of Themeable type then passed the newl selected theme for update
  var currentTheme: Theme {
    didSet {
      guard currentTheme.id != oldValue.id else { return }
      self.notifyObserversForThemeChange()
    }
  }
  
  /// Collection of Themeable observers.
  /// Themeable registers and deregisters from this collection based on their need of real time theming update and their life cyle.
  /// For example, BaseViewController instances registers to this collection if they need to be notified and recieve the updated theme
  /// when theme changes. They automatically get deregistered when the are removed from the view hieracrcy i.e. on call of viewWillDisappear()
  private var observers: [Themeable]
  
  private init() {
    self.observers = [Themeable]()
    self.currentTheme = AppTheme()
  }
  
  /// Registers Themeable to the collection of observers for recieving updates about the application theme change
  func addObserver(_ observer: Themeable) {
    guard self.observers.firstIndex(where: { $0.id == observer.id }) == nil else { return }
    self.observers.append(observer)
  }
  
  /// Removes Themeable frome the collection of observers so that they don't recieve updates about the application theme change
  func removeObserver(_ observer: Themeable) {
    guard let index = self.observers.firstIndex(where: { $0.id == observer.id }) else { return }
    self.observers.remove(at: index)
  }
  
  /// Notifying registeered observers about the application theme change and passing the updated Theme
  private func notifyObserversForThemeChange() {
    for observer in self.observers {
      if observer.isThemingEnabled {
        observer.didReceiveTheme(self.currentTheme)
      }
    }
  }
}
