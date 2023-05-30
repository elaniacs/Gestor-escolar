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
        let queryItems = buildQueryItems(parameters: ["matricula": "2011004", "senha": "99999999", "token": "X", "so": "ios"])
        network.fetchRequest(urlPath: "/escola/mobile_login.php", httpMethod: .get, queryItems: queryItems) { responseData in
            completion?(responseData)
        }
    }
    
    func gellAllSchedule(completion: ((ScheduleModel?) -> Void)?) {
        let queryItems = buildQueryItems(parameters: ["matricula": "2011004", "senha": "99999999", "ano": "20231"])
        network.fetchRequest(urlPath: "/escola/json_horario_aluno.php", httpMethod: .get, queryItems: queryItems) { responseData in
            completion?(responseData)
        }
    }
    
    func buildQueryItems(parameters: [String: String]) -> [URLQueryItem] {
        var queryItems: [URLQueryItem] = []
        
        for (key, value) in parameters {
            let queryItem = URLQueryItem(name: key, value: value)
            queryItems.append(queryItem)
        }
        
        return queryItems
    }
}
