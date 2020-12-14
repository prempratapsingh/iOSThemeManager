//
//  Theme.swift
//  ThemeManager
//
//  Created by Prem Pratap Singh on 11/12/20.
//

import UIKit

/// Protocol for application theme

protocol Theme {
  
  /// Id is used to uniquly identify thme objects and also for detecting change in application theme with id based comparision
  var id: String { get }
  
  /// Theme color details
  var primaryColor: UIColor { get set }
  var secondaryColor: UIColor { get set }
  
  // Add logic for dark/light mode and contrast
}
