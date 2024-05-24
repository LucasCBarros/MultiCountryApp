//
//  TeslaUSViewController.swift
//  TeslaUS
//
//  Created by Lucas C Barros on 2024-05-23.
//

import UIKit

class TeslaUSViewController: UIViewController, Coordinating {
    // MARK: - Views
    var centralLabel = UILabel()
    
    // MARK: - Properties
    var coordinator: Coordinator?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubviews([centralLabel])
        centralLabel.text = "Hello America!"
        centralLabel.font = .systemFont(ofSize: 30, weight: .heavy)
        centralLabel.sizeToSuperview()
        centralLabel.textAlignment = .center
        
        self.view.backgroundColor = .systemBlue
    }
}
