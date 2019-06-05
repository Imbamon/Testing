//
//  ButtonsCell.swift
//  TestProject
//
//  Created by Илья Разгильдеев on 18/05/2019.
//  Copyright © 2019 Илья Разгильдеев. All rights reserved.
//

import UIKit

protocol ButtonsCellDelegate{
    
    func startTimer()
    func stopTimer()
    func resetTimer()
    
}


class ButtonsCell: UITableViewCell {
    
    @IBOutlet weak var startBut: UIButton!
    @IBOutlet weak var stopBut: UIButton!
    @IBOutlet weak var resetBut: UIButton!
    
    var delegate:ButtonsCellDelegate?
    
    
    var timeModel = TimerCell()
    
    
    var timer = Timer()
    var isTimerRunning = false
    var counter = 0.0
    
    @IBAction func startButton(_ sender: UIButton) {
        
            delegate?.startTimer()
            resetBut.isEnabled = true
            startBut.isEnabled = false
            stopBut.isEnabled = true
        }
  
    @IBAction func stopButton(_ sender: UIButton) {
            delegate?.stopTimer()
            resetBut.isEnabled = true
            startBut.isEnabled = true
            stopBut.isEnabled = false
        
    }
    @IBAction func resetButton(_ sender: UIButton) {
        
            delegate?.resetTimer()
            resetBut.isEnabled = false
            startBut.isEnabled = true
            stopBut.isEnabled = true
        
    }
    
    
    
    override func awakeFromNib() {
        setup()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup() {
        
        startBut.layer.cornerRadius = 25
        startBut.clipsToBounds = true
        stopBut.layer.cornerRadius = 25
        stopBut.clipsToBounds = true
        resetBut.layer.cornerRadius = 25
        resetBut.clipsToBounds = true
    }
    
}
