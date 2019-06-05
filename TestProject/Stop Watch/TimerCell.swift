//
//  TimerCell.swift
//  TestProject
//
//  Created by Илья Разгильдеев on 18/05/2019.
//  Copyright © 2019 Илья Разгильдеев. All rights reserved.
//

import UIKit


protocol TimerCellDelegate {
    func addCell()
    
}

class TimerCell: UITableViewCell {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var delegateTime:TimerCellDelegate?
    
    var timer = Timer()
    var isTimerRunning = false
    var counter = 0.0

    var timing:String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func startTimer(){
        
        if !isTimerRunning{
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            isTimerRunning = true
        }
    }
    func stopTimer(){
        
        isTimerRunning = false
        timer.invalidate()
    }
    
    func resetTimer(){
        
        timer.invalidate()
        isTimerRunning = false
        counter = 0.0
        
        timerLabel.text = "00:00:00.0"
    }
    
    @IBAction func timerButton(_ sender: UIButton) {
         delegateTime?.addCell()
    }
    
    @objc func runTimer(){
        counter += 0.1
        let flooredCounter = Int(floor(counter))
        let hour = flooredCounter / 3600
        let minute = (flooredCounter % 3600) / 60
        var minuteString = "\(minute)"
        if minute < 10 {
            minuteString = "0\(minute)"
        }
        let second = (flooredCounter % 3600) % 60
        var secondString = "\(second)"
        if second < 10{
            secondString = "0\(second)"
        }
        let decisecond = String(format: "%.1f",counter).components(separatedBy: ".").last!
        timing = "\(hour):\(minuteString):\(secondString).\(decisecond)"
        timerLabel.text = timing
    }
    
    private func setup() {
        timerLabel.text = "00:00:00.0"
    }
}

