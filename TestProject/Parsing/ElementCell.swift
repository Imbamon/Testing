//
//  ElementCell.swift
//  TestProject
//
//  Created by Илья Разгильдеев on 17/05/2019.
//  Copyright © 2019 Илья Разгильдеев. All rights reserved.
//

import UIKit

class ElementCell: UITableViewCell {

    @IBOutlet weak var idElement: UILabel!
    @IBOutlet weak var userIdElement: UILabel!
    @IBOutlet weak var titleElement: UILabel!
    @IBOutlet weak var bodyElement: UILabel!
    
    private var elem:Element?{
        didSet{
            
            if let idElem = elem?.id {
                idElement.text = "id" + " " + String(idElem)
            }
            if let userIdElem = elem?.userId{
                userIdElement.text = String(userIdElem)
            }
            titleElement.text = elem?.title
            bodyElement.text = elem?.body
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateView(with model: Element) {
        self.elem = model
    }
    
    private func setup() {
        idElement.text = ""
        userIdElement.text = ""
        titleElement.text = ""
        bodyElement.text = ""
    }
    
}
