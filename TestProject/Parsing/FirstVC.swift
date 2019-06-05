//
//  FirstVC.swift
//  TestProject
//
//  Created by Илья Разгильдеев on 17/05/2019.
//  Copyright © 2019 Илья Разгильдеев. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    private var apiService = APIService()
    private var router = Router()
    private var elements: [Element]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "ElementCell", bundle: nil), forCellReuseIdentifier: "ElementCell")
        tableView.estimatedRowHeight = 250
        tableView.dataSource = self
        tableView.delegate = self
        
        
        apiService.getRequest(path:"/posts") { (elements, error) in
            if let error = error {
                debugPrint(error)
            } else if let elements = elements {
                self.elements = elements as? [Element]
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
    }
}

extension FirstVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let element = elements?[indexPath.row] else {return}
        
        router.routeToDetailedPost(fromVc: self, elem: element)
        
    }
    
}


extension FirstVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let elements = elements else {return 0}
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let elements = elements else { return UITableViewCell() }
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ElementCell", for: indexPath) as? ElementCell {
            cell.updateView(with: elements[indexPath.row])
            return cell
        }
        else{
            return  UITableViewCell()
        }
    }
    
}


