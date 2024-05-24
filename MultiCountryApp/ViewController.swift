//
//  ViewController.swift
//  MultiCountryApp
//
//  Created by Lucas C Barros on 2024-05-23.
//

import UIKit

class ViewController: UIViewController, Coordinating {
    // MARK: - Views
    var centralLabel = UILabel()
    var openFeatureButton = UIButton()
    
    // MARK: - Properties
    var coordinator: Coordinator?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc func didTap() {
        coordinator?.eventOccurred(with: .openFirstFeature)
    }
}

// MARK: - Setup UI
extension ViewController: ViewCodable {
    func addHierarchy() {
        self.view.addSubviews([centralLabel,
                               openFeatureButton])
    }
    
    func addConstraints() {
        centralLabel
            .heightTo(50)
            .widthToSuperview(-100)
            .centerToSuperview()
        
        openFeatureButton
            .heightTo(50)
            .widthToSuperview(-100)
            .centerHorizontalToSuperView()
            .topToBottom(of: centralLabel)
    }
    
    func additionalConfig() {
        centralLabel.text = "Hello there!"
        
        centralLabel.textAlignment = .center
        
        openFeatureButton.setTitle("Open feature", for: .normal)
        openFeatureButton.backgroundColor = .systemGreen
        openFeatureButton.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        
        self.view.backgroundColor = .systemYellow
        title = "Entry Point"
    }
}
