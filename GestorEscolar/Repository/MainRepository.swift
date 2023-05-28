//
//  MainRepository.swift
//  GestorEscolar
//
//  Created by Cáren Sousa on 27/05/23.
//

import Foundation


class MainRepository {
    
    let network = Network(session: URLSession.shared)
    weak var mainCoordinator: MainCoordinator?
    
    func getAllMenu(completion: ((HomeModel?) -> Void)?) {
        network.fetchRequest(urlPath: "/escola/mobile_login.php", httpMethod: .get) { responseData in
            completion?(responseData)
        }
    }
}



