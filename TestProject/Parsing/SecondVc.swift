//
//  SecondVc.swift
//  TestProject
//
//  Created by Илья Разгильдеев on 17/05/2019.
//  Copyright © 2019 Илья Разгильдеев. All rights reserved.
//

import UIKit

class SecondVc: UIViewController {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var tableViewCom: UITableView!
    @IBOutlet weak var tableText: UILabel!
    
    private var apiService = APIService()
    private var router = Router()
    
    private var comments:[Comment]?
    private var filteredComments:[Comment]?
    
    var labelId:String?
    var labelText:String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.idLabel.text = labelId
        self.tableText.text = labelText
        
        tableViewCom.register(UINib(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: "CommentCell1")
        tableViewCom.dataSource = self
        tableViewCom.delegate = self
        tableViewCom.estimatedRowHeight = 250
        apiService.getRequest(path:"/comments") { (comments, error) in
            if let error = error {
                debugPrint(error)
            } else if let comments = comments {
                self.comments = comments as? [Comment]
                self.filteredComments = self.comments!.filter{ String($0.postId!) == self.labelId! }
                DispatchQueue.main.async {
                    self.tableViewCom.reloadData()
                }
            }
        }
        
    }

}

extension SecondVc: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let filteredComments = filteredComments else {return 0}
        return filteredComments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let filteredComments = filteredComments else { return UITableViewCell() }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell1", for: indexPath) as? CommentCell {
            cell.updateView(with: filteredComments[indexPath.row])
            return cell
        }
        else{
            return  UITableViewCell()
        }
    }
    
    
}
extension SecondVc: UITableViewDelegate{
    
}


