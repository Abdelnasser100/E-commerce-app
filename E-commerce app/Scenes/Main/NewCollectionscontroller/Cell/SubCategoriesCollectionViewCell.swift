//
//  SubCategoriesCollectionViewCell.swift
//  E-commerce app
//
//  Created by Abdelnasser on 24/03/2023.
//

import UIKit

class SubCategoriesCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var categoryNameLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cardView.layer.cornerRadius = 8
    }

}
