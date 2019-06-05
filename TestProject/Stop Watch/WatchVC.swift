//
//  WatchVC.swift
//  TestProject
//
//  Created by Илья Разгильдеев on 18/05/2019.
//  Copyright © 2019 Илья Разгильдеев. All rights reserved.
//

import UIKit


class WatchVC: UIViewController,ButtonsCellDelegate, TimerCellDelegate {
    
    var time:[String] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TimerCell", bundle: nil), forCellReuseIdentifier: "TimerCell")
        tableView.register(UINib(nibName: "ButtonsCell", bundle: nil), forCellReuseIdentifier: "ButtonsCell")
        tableView.register(UINib(nibName: "AdditionalCell", bundle: nil), forCellReuseIdentifier: "AdditionalCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func addCell() {
        let indexPath = IndexPath(row: 0, section: 0)
        let timerCell = tableView.cellForRow(at: indexPath) as? TimerCell
        let textTimer = timerCell!.timerLabel.text!
        time.insert(textTimer, at: 0)
        
        tableView.reloadData()
    }
    
    func stopTimer() {
        let indexPath = IndexPath(row: 0, section: 0)
        
        let timerCell = tableView.cellForRow(at: indexPath) as? TimerCell
        timerCell?.stopTimer()
    }
    
    func resetTimer() {
        let indexPath = IndexPath(row: 0, section: 0)
        
        let timerCell = tableView.cellForRow(at: indexPath) as? TimerCell
        time = []
        tableView.reloadData()
        timerCell?.resetTimer()
    }
    
    func startTimer() {
        let indexPath = IndexPath(row: 0, section: 0)
        
        let timerCell = tableView.cellForRow(at: indexPath) as? TimerCell
        timerCell?.startTimer()
    }
    

}

extension WatchVC: UITableViewDelegate {
    
}

extension WatchVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return time.count + 2
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height = 0
        if indexPath.row == 1{
            height = 60
        }else if indexPath.row == 0 {
            height =  100
        }else if indexPath.row >= 2 {
           height = 50
        }
        return CGFloat(height)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TimerCell", for: indexPath) as? TimerCell {
                cell.delegateTime = self
                return cell
            }
            else{
                return  UITableViewCell()
            }
        }
        if indexPath.row == 1{
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonsCell", for: indexPath) as? ButtonsCell {
                cell.delegate = self
                
                return cell
            }
            
        }
        else if indexPath.row >= 2{
            if let cell = tableView.dequeueReusableCell(withIdentifier: "AdditionalCell", for: indexPath) as? AdditionalCell {
                cell.extraTime.text = time[indexPath.row - 2]
                return cell
            }
        }
        return UITableViewCell()
    }
      
    }


    


