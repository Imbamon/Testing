//
//  CommentCell.swift
//  TestProject
//
//  Created by Илья Разгильдеев on 17/05/2019.
//  Copyright © 2019 Илья Разгильдеев. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var nameComment: UILabel!
    @IBOutlet weak var emailComment: UILabel!
    @IBOutlet weak var textComment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    private var comm:Comment?{
        didSet{
            if let nameComm = comm?.name{
                nameComment.text = nameComm
            }
            if let emailComm = comm?.email{
                emailComment.text = emailComm
            }
            if let textComm = comm?.body{
                textComment.text = textComm
            }
        }
    }
    func updateView(with model: Comment) {
        self.comm = model
    }
    
    private func setup() {
        nameComment.text = ""
        emailComment.text = ""
        textComment.text = ""
    }
}
