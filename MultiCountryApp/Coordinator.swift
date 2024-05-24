//
//  Coordinator.swift
//  MultiCountryApp
//
//  Created by Lucas C Barros on 2024-05-23.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    
    func start()
    func eventOccurred(with type: Event)
}

enum Event {
    case openFirstFeature
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
