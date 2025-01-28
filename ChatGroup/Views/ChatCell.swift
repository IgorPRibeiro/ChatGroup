//
//  ChatCell.swift
//  ChatGroup
//
//  Created by Igor Pinheiro Ribeiro on 28/01/25.
//

import UIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var chatBubble: UIView!
    
    @IBOutlet weak var label: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
