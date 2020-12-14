//
//  MainVC.swift
//  ThemeManager
//
//  Created by Prem Pratap Singh on 11/12/20.
//

import UIKit

class MainVC: BaseViewController {

  private lazy var changeThemeButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Change App Theme", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .black
    button.layer.cornerRadius = 5
    button.addTarget(self, action: #selector(didTapOnChangeThemeButton), for: .touchUpInside)
    return button
  }()
  
  private lazy var containerView: ContainerView = {
    let view = ContainerView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 16
    view.isThemingEnabled = true
    return view
  }()
  
  private lazy var footerView: FooterView = {
    let view = FooterView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 16
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureView()
  }
  
  private func configureView() {
    
    /// Registering to recieve update about application theme change
    self.isThemingEnabled = true
    
    self.view.addSubview(self.changeThemeButton)
    
    NSLayoutConstraint.activate([
      self.changeThemeButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60),
      self.changeThemeButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
      self.changeThemeButton.widthAnchor.constraint(equalToConstant: 175),
      self.changeThemeButton.heightAnchor.constraint(equalToConstant: 40)
    ])
    
    self.view.addSubview(self.containerView)
    NSLayoutConstraint.activate([
      self.containerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
      self.containerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0),
      self.containerView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7, constant: 0),
      self.containerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5, constant: 0)
    ])
    
    self.view.addSubview(self.footerView)
    NSLayoutConstraint.activate([
      self.footerView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 24),
      self.footerView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -24),
      self.footerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -24),
      self.footerView.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
  
  
  override func didReceiveTheme(_ theme: Theme) {
    self.view.backgroundColor = theme.primaryColor
  }
  
  @objc func didTapOnChangeThemeButton() {
    let themeSelectorVC = ThemeSelectorVC()
    themeSelectorVC.modalTransitionStyle = .crossDissolve
    themeSelectorVC.modalPresentationStyle = .overCurrentContext
    self.present(themeSelectorVC, animated: true)
  }
}

