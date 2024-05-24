//
//  ViewController+Extension.swift
//  TeslaUS
//
//  Created by Lucas C Barros on 2024-05-24.
//

import Foundation

extension ViewController {
    func setupSecondFeatureButton() {
        addSecondFeatureButtonHierarchy()
        addSecondFeatureButtonConstraints()
        additionalSecondFeatureButtonConfig()
    }
    
    func addSecondFeatureButtonHierarchy() {
        self.view.addSubviews([secondFeatureButton])
    }
    
    func addSecondFeatureButtonConstraints() {
        secondFeatureButton
            .heightTo(50)
            .widthToSuperview(-100)
            .centerHorizontalToSuperView()
            .topToBottom(of: openFeatureButton, margin: 15)
    }
    
    func additionalSecondFeatureButtonConfig() {
        secondFeatureButton.setTitle("Second feature", for: .normal)
        secondFeatureButton.backgroundColor = .systemGreen
        secondFeatureButton.addTarget(self,
                                      action: #selector(tapSecondFeatureButton),
                                      for: .touchUpInside)
    }
    
    @objc func tapSecondFeatureButton() {
        isBackgroundLight.toggle()
        self.view.backgroundColor = isBackgroundLight ? .systemRed : .systemOrange
    }
}
