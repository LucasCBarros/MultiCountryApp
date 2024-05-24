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
    
    // TeslaUS Specific
    var secondFeatureButton = UIButton()
    var isBackgroundLight = false
    
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
        centralLabel.text = "Feature Separation POC"
        
        centralLabel.textAlignment = .center
        
        openFeatureButton.setTitle("Open feature", for: .normal)
        openFeatureButton.backgroundColor = .systemGreen
        openFeatureButton.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        
        self.view.backgroundColor = .systemYellow
        title = "Entry Point"
        
        setupSecondFeatureButton()
    }
}

// MARK: - Force requirements for Second Feature Button
protocol SecondFeatureButtonProtocol {
    // Add in shared ViewController
    var secondFeatureButton: UIButton { get set }
    var isBackgroundLight: Bool { get set }
    
    // Add in extension for each target with different behaviour
    func setupSecondFeatureButton()
}

// Added in extension of ViewController to keep it clean
extension ViewController: SecondFeatureButtonProtocol { }

// Otherwise adding multiple features might look like this in the future
//class ViewController: UIViewController,
//                      Coordinating,
//                      FirstFeatureButtonProtocol,
//                      SecondFeatureButtonProtocol,
//                      ThirdFeatureButtonProtocol,
//                      ForthFeatureButtonProtocol,
//                      FifthFeatureButtonProtocol { }
