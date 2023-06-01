//
//  ScheduleTVHeader.swift
//  GestorEscolar
//
//  Created by Cáren Sousa on 30/05/23.
//

import UIKit

class ScheduleTVHeader: UIView {
    
    let sectionHeaderLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 198/255, green: 210/255, blue: 226/255, alpha: 1)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func populateHeader(title: String?) {
        sectionHeaderLabel.text = title
    }
    
    func commonInit() {
        setupView()
    }
    
    func setupView() {
        addSubview(sectionHeaderLabel)
        sectionHeaderLabel.frame = frame
    }
}


