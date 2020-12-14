//
//  FooterView.swift
//  ThemeManager
//
//  Created by Prem Pratap Singh on 11/12/20.
//

import UIKit

class FooterView: BaseView {
  
  override func didReceiveTheme(_ theme: Theme) {
    self.backgroundColor = theme.secondaryColor
  }
}
