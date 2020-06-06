//
//  CategoryTableViewCell.swift
//  Kirokugram
//
//  Created by Shu Fujita on 2020/06/05.
//  Copyright © 2020 Fujita shu. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
     @IBOutlet var  categoryLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
