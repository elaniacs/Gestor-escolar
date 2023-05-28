//
//  HomeModel.swift
//  GestorEscolar
//
//  Created by Cáren Sousa on 28/05/23.
//

import Foundation


struct HomeModel: Decodable {
    let config: ConfigModel
    let menu: [MenuModel]
    let ano: String
    let codigo_escola: String
    let logo_escola: String
    let serie: String
    let turma: String
    let turno: String
    let escola: String
    let matricula: String
    let nome: String
    let tipo_acesso: String
    let tipo_usuario: String
    let nascimento: String
    let qtd_notes: Int
    let boletim: String
    let infantil: String
    let data_foto: String
    let data_logotipo: String
    let logo_quadrado: String
    let sti: Bool
    let regular: Bool
    let coordenadores: [String]
    let etapa: String
    let proximo_ano: String
    let proxima_serie: String
    let proximo_grau_serie: String
    let boleto_processado: String
    let permissao_matricula: String
    let data_aceite: String?
    let STI: String
}

struct ConfigModel: Decodable {
    let cor_app: String
    let cor_header: String
    let cor_fonte: String
    let selecionado: String
    let nao_selecionado: String
    let data: String
    let infantil_texto_livre: String
    let versao_atualizacao: Int
}

struct MenuModel: Decodable {
    let opc: String
    let titulo: String
    let link: String
    let icone: String
    let horario_titulo: String
    let horario1: String
    let horario2: String
}


