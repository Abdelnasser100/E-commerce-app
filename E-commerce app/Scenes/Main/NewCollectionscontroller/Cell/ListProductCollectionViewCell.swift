//
//  ProductCollectionViewCell.swift
//  E-commerce app
//
//  Created by Abdelnasser on 25/03/2023.
//

import UIKit

class ListProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var desLable: UILabel!
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var isFavButton: UIButton!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        productImage.layer.cornerRadius = 8
    }

}
