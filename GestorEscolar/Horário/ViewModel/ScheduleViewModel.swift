//
//  ScheduleViewModel.swift
//  GestorEscolar
//
//  Created by Cáren Sousa on 29/05/23.
//

import Foundation

class ScheduleViewModel {
    
    var mainRepository: MainRepository?
    var scheduleCell: [[ScheduleCellModel]] = []
    var schedule: ScheduleModel?
    
    
    func gellAllSchedule(completion: (() -> Void)?) {
        mainRepository?.gellAllSchedule() { responseData in
            if let responseData = responseData {
                self.schedule = responseData
                self.scheduleCell = self.convertToScheduleCellModels(schedules: responseData)
                completion?()
            }
        }
    }
    
    func convertToScheduleCellModels(schedules: ScheduleModel) -> [[ScheduleCellModel]] {
        
        var scheduleCellModels: [[ScheduleCellModel]] = []
        for dia in schedules.horario {
            var scheduleCellModel: [ScheduleCellModel] = []
            for disciplina in dia.horarios {
                let scheduleCell = ScheduleCellModel(disciplina: disciplina.disciplina, professor: disciplina.professor, inicio: disciplina.inicio, fim: disciplina.fim)
                scheduleCellModel.append(scheduleCell)
            }
            scheduleCellModels.append(scheduleCellModel)
        }
        return scheduleCellModels
    }
}



