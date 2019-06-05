//
//  StartVC.swift
//  TestProject
//
//  Created by Илья Разгильдеев on 16/05/2019.
//  Copyright © 2019 Илья Разгильдеев. All rights reserved.
//

import UIKit

class StartVC: UIViewController {


    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var blogButton: UIButton!
    @IBOutlet weak var timerButton: UIButton!
    @IBOutlet weak var summaryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func setup(){
        //Настройка кнопок
        mapButton.layer.cornerRadius = 10
        mapButton.layer.shadowRadius = 4.0
        mapButton.layer.shadowOpacity = 0.6
        mapButton.layer.shadowOffset = CGSize.zero
        blogButton.layer.cornerRadius = 10
        blogButton.layer.shadowRadius = 4.0
        blogButton.layer.shadowOpacity = 0.6
        blogButton.layer.shadowOffset = CGSize.zero
        timerButton.layer.cornerRadius = 10
        timerButton.layer.shadowRadius = 4.0
        timerButton.layer.shadowOpacity = 0.6
        timerButton.layer.shadowOffset = CGSize.zero
        summaryButton.layer.cornerRadius = 10
        summaryButton.layer.shadowRadius = 4.0
        summaryButton.layer.shadowOpacity = 0.6
        summaryButton.layer.shadowOffset = CGSize.zero
        
    }
    
}
