//
//  HomeCVCell.swift
//  GestorEscolar
//
//  Created by Cáren Sousa on 27/05/23.
//

import UIKit

class HomeCVCell: UICollectionViewCell  {
    
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var menuLabel: UILabel!
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.1) {
                if self.isHighlighted {
                    self.contentView.backgroundColor = UIColor.lightGray
                } else {
                    self.contentView.backgroundColor = UIColor.white
                }
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.layer.cornerRadius = 20
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 2
    }
    
    func populateCell(data: MenuCellModel) {
        menuImageView.image = UIImage(named: data.icone)
        menuLabel.text = data.titulo
    }
}

