//
//  SummaryVC.swift
//  TestProject
//
//  Created by Илья Разгильдеев on 21/05/2019.
//  Copyright © 2019 Илья Разгильдеев. All rights reserved.
//

import UIKit

class SummaryVC: UIViewController, EditableVCDelegate {
    
    func fillLabels(name: String, age: String, about: String,experience:String) {
        nameLabel.text = name
        ageLabel.text = age
        aboutLabel.text = about
        experienceLabel.text = experience
    }
    let editable = EditableVC()

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var ageLabel: UITextField!
    @IBOutlet weak var aboutLabel: UITextView!
    @IBOutlet weak var experienceLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = UserDefaults.standard.string(forKey: "isNamed"){
            nameLabel.text = name
        }else {
            nameLabel.text = ""
            
        }
        
        if let age = UserDefaults.standard.string(forKey: "isAged"){
            ageLabel.text = age
        }else {
            ageLabel.text = ""
            
        }
        if let about = UserDefaults.standard.string(forKey: "isAbout"){
            aboutLabel.text = about
        }else {
            aboutLabel.text = ""
            
        }
        
        if let experience = UserDefaults.standard.string(forKey: "isExperience"){
            experienceLabel.text = experience
        }else{
            experienceLabel.text = ""
            
        }
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {     //segue
        if segue.identifier == "editVC"{
            let destinationVC = segue.destination as! EditableVC
            destinationVC.delegate = self
            destinationVC.nameEditable = nameLabel.text
            destinationVC.ageEditable = ageLabel.text
            destinationVC.aboutEditable = aboutLabel.text
            destinationVC.experienceEditable = experienceLabel.text
        }
    }
    @IBAction func editSummary(_ sender: UIButton) {
        
    }
    
}
