//
//  AdditionalCell.swift
//  TestProject
//
//  Created by Илья Разгильдеев on 18/05/2019.
//  Copyright © 2019 Илья Разгильдеев. All rights reserved.
//

import UIKit

class AdditionalCell: UITableViewCell {

    @IBOutlet weak var extraTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
