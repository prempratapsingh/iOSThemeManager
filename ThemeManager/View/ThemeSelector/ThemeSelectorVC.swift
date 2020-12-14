//
//  ThemeSelectorVC.swift
//  ThemeManager
//
//  Created by Prem Pratap Singh on 11/12/20.
//

import UIKit

class ThemeSelectorVC: BaseViewController {
  
  private let primaryColors: [UIColor] = [.red, .orange, .green, .blue, .purple]
  private let secondaryColors: [UIColor] = [.yellow, .blue, .orange, .green, .orange]
  
  private lazy var colorContainerView: UIStackView = {
    let container = UIStackView()
    container.translatesAutoresizingMaskIntoConstraints = false
    container.spacing = 20
    container.distribution = .fill
    container.axis = .vertical
    return container
  }()
  
  private lazy var containerView: ContainerView = {
    let view = ContainerView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 16
    view.isThemingEnabled = true
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureView()
  }
  
  private func configureView() {
    self.view.backgroundColor = .white
    
    self.view.addSubview(self.colorContainerView)
    NSLayoutConstraint.activate([
      self.colorContainerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0),
      self.colorContainerView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 24),
      self.colorContainerView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -24)
    ])
    
    for (i, color) in self.primaryColors.enumerated() {
      let button = UIButton()
      button.tag = i
      button.backgroundColor = color
      button.heightAnchor.constraint(equalToConstant: 50).isActive = true
      button.addTarget(self, action: #selector(didTapOnColorButton), for: .touchUpInside)
      self.colorContainerView.addArrangedSubview(button)
    }
    
    self.view.addSubview(self.containerView)
    NSLayoutConstraint.activate([
      self.containerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -24),
      self.containerView.leftAnchor.constraint(equalTo: self.colorContainerView.leftAnchor, constant: 0),
      self.containerView.rightAnchor.constraint(equalTo: self.colorContainerView.rightAnchor, constant: 0),
      self.containerView.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
  
  @objc private func didTapOnColorButton(sender: UIButton) {
    var theme = AppTheme()
    theme.primaryColor = self.primaryColors[sender.tag]
    theme.secondaryColor = self.secondaryColors[sender.tag]
    
    ThemeManager.shared.currentTheme = theme
    self.dismiss(animated: true)
  }
}
