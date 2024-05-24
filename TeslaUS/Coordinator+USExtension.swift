//
//  Coordinator+USExtension.swift
//  TeslaUS
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
        case .openFirstFeature:
            var vc: UIViewController & Coordinating = TeslaUSViewController()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
