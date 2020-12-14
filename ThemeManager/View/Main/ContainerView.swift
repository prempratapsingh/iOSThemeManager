//
//  ContainerView.swift
//  ThemeManager
//
//  Created by Prem Pratap Singh on 11/12/20.
//

import UIKit

class ContainerView: BaseView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    /// Registering to recieve update about application theme change
    self.isThemingEnabled = true
    self.isThemingEnabled = true
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    
    /// Registering to recieve update about application theme change
    self.isThemingEnabled = true
    self.isThemingEnabled = true
  }
  
  /// Applys current application theme to the view
  override func didReceiveTheme(_ theme: Theme) {
    self.backgroundColor = theme.secondaryColor
  }
}
