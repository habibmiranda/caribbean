//
//  DetailTableViewCell.swift
//  Caribbean
//
//  Created by Habib Miranda-Garcia on 7/5/19.
//  Copyright © 2019 Habib Miranda-Garcia. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.textColor = rgbas.white
        detailLabel.textColor = rgbas.white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
