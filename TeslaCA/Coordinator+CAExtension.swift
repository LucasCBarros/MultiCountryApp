//
//  Coordinator+CAExtension.swift
//  TeslaCA
//
//  Created by Lucas C Barros on 2024-05-23.
//

import UIKit

extension Coordinator {
    func start() {
        var vc: UIViewController & Coordinating = ViewController()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
    }
    
    func eventOccurred(with type: Event) {
        switch type {
        case .buttonTapped:
            var vc: UIViewController & Coordinating = TeslaCAViewController()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
