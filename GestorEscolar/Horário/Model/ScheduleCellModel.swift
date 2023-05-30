//
//  ScheduleCellModel.swift
//  GestorEscolar
//
//  Created by Cáren Sousa on 29/05/23.
//

import Foundation


struct ScheduleCellModel {
    let disciplina: String
    let professor: String
    let inicio: String
    let fim: String
    
    func formatedProfessor() -> String {
        let professor = "Prof(a) \(professor)"
        return professor
    }
    
    func formatedTimeGap() -> String {
        let horarioInicial = formatarHorario(tempo: inicio)
        let horarioFinal = formatarHorario(tempo: fim)
        
        return "de \(horarioInicial) a \(horarioFinal)"
    }
    
    func formatarHorario(tempo: String) -> String {
        let hora = String(tempo.prefix(2))
        let minutos = String(tempo.suffix(2))
        
        return "\(hora):\(minutos)"
    }
}

