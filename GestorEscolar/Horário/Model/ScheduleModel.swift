//
//  ScheduleModel.swift
//  GestorEscolar
//
//  Created by Cáren Sousa on 29/05/23.
//

import Foundation

struct ScheduleModel: Decodable {
    let horario: [Dia]
}

struct Dia: Decodable {
    let dia: String
    let horarios: [Disciplina]
}

struct Disciplina: Decodable {
    let escola: String
    let codigo_serie: String
    let serie: String
    let turno: String
    let turma: String
    let codigo_disciplina: String
    let disciplina: String
    let inicio: String
    let fim: String
    let professor: String
}

