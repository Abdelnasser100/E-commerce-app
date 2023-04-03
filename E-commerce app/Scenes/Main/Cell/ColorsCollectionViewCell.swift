//
//  ColorsCollectionViewCell.swift
//  E-commerce app
//
//  Created by Abdelnasser on 02/04/2023.
//

import UIKit

class ColorsCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var colorsView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        superview?.layoutSubviews()
        
        colorsView.layer.cornerRadius = colorsView.frame.height / 2
    }

}
