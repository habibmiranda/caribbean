//
//  ListTableViewCell.swift
//  Caribbean
//
//  Created by Habib Miranda-Garcia on 7/4/19.
//  Copyright © 2019 Habib Miranda-Garcia. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.textColor = rgbas.white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
