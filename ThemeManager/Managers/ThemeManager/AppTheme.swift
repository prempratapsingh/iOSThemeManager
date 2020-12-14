//
//  AppTheme.swift
//  ThemeManager
//
//  Created by Prem Pratap Singh on 11/12/20.
//

import UIKit

/// Theme container for the application
/// It contains application theming details like - color, font, icon,  etc

struct AppTheme: Theme {
  var id = UUID().uuidString
  
  var primaryColor: UIColor = .orange
  var secondaryColor: UIColor = .blue
  
  // Add more Color and Font Styling attributes as needed
}
