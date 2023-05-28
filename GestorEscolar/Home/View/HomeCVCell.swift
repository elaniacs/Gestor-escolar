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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        menuImageView.image = UIImage(named: "iPadNotes.png")
    }
}
