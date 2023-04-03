//
//  MassagesTableViewCell.swift
//  E-commerce app
//
//  Created by Abdelnasser on 29/03/2023.
//

import UIKit

class MassagesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitleLable: UILabel!
    @IBOutlet weak var messageLable: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        productImage.layer.cornerRadius = productImage.frame.height / 2
    }
    
}
