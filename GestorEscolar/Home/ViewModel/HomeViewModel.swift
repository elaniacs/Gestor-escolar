//
//  HomeViewModel.swift
//  GestorEscolar
//
//  Created by Cáren Sousa on 28/05/23.
//

import Foundation

class HomeViewModel {
    
    var mainRepository: MainRepository?
    var menuCell: [MenuCellModel] = []
    var menu: [MenuModel] = []
    
    
    func getAllMenu(completion: (() -> Void)?) {
        mainRepository?.getAllMenu() { responseData in
            if let responseData = responseData {
                self.menu = responseData.menu
                self.menuCell = self.convertToFeedCellModels(menus: responseData.menu)
                completion?()
            }
        }
    }
    
    func convertToFeedCellModels(menus: [MenuModel]) -> [MenuCellModel] {
        var menuCellModels: [MenuCellModel] = []
        
        for menu in menus {
            let menuCell = MenuCellModel(icone: menu.icone, titulo: menu.titulo)
            menuCellModels.append(menuCell)
        }
        
        return menuCellModels
    }
}





