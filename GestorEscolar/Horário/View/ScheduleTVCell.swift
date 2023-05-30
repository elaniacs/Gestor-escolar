//
//  ScheduleTVCell.swift
//  GestorEscolar
//
//  Created by Cáren Sousa on 29/05/23.
//

import UIKit


class ScheduleTVCell: UITableViewCell {
    
    
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var teacherLabel: UILabel!
    @IBOutlet weak var timeInterval: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func populateCell(data: ScheduleCellModel) {
        courseLabel.text = data.disciplina
        teacherLabel.text = data.formatedProfessor()
        timeInterval.text = data.formatedTimeGap()
    }
    
}
