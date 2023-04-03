//
//  ChatListTableViewCell.swift
//  E-commerce app
//
//  Created by Abdelnasser on 01/04/2023.
//

import UIKit

class ChatListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var stackView:UIStackView!
    @IBOutlet weak var messageLable:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
