//
//  TeslaCAViewController.swift
//  MultiCountryApp
//
//  Created by Lucas C Barros on 2024-05-23.
//

import UIKit

class TeslaCAViewController: UIViewController, Coordinating {
    
    // MARK: - Views
    var centralLabel = UILabel()
    var switchColorButton = UIButton()
    
    // MARK: - Properties
    var coordinator: Coordinator?
    var isBackgroundLight = false

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Actions
    @objc func didTap() {
        isBackgroundLight.toggle()
        self.view.backgroundColor = isBackgroundLight ? .systemCyan : .systemMint
    }
}

// MARK: - Setup UI
extension TeslaCAViewController: ViewCodable {
    func addHierarchy() {
        self.view.addSubviews([centralLabel,
                               switchColorButton])
    }
    
    func addConstraints() {
        centralLabel
            .heightTo(50)
            .widthToSuperview(-100)
            .centerToSuperview()
        
        switchColorButton
            .heightTo(50)
            .widthToSuperview(-100)
            .centerHorizontalToSuperView()
            .bottomToTop(of: centralLabel)
    }
    
    func additionalConfig() {
        centralLabel.text = "Hello Canada!"
        centralLabel.textAlignment = .center
        
        switchColorButton.setTitle("Feature Action", for: .normal)
        switchColorButton.backgroundColor = .systemBlue
        switchColorButton.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        
        self.view.backgroundColor = .systemPurple
    }
}
