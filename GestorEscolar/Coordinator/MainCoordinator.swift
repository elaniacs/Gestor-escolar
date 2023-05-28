//
//  MainCoordinator.swift
//  GestorEscolar
//
//  Created by Cáren Sousa on 27/05/23.
//

import UIKit

class MainCoordinator {
    var navigationController: UINavigationController
    var mainRepository = MainRepository()
    
    init(navigation: UINavigationController) {
        self.navigationController = navigation
        mainRepository.mainCoordinator = self
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
            navigationController.pushViewController(viewController, animated: true)
        }
    }
}


