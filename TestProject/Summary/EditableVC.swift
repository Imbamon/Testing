//
//  EditableVC.swift
//  TestProject
//
//  Created by Илья Разгильдеев on 21/05/2019.
//  Copyright © 2019 Илья Разгильдеев. All rights reserved.
//

import UIKit

protocol EditableVCDelegate{
    func fillLabels(name:String, age:String, about:String, experience:String)
}

class EditableVC: UIViewController {
    
    var delegate:EditableVCDelegate?
    
    @IBOutlet weak var editName: UITextField!
    @IBOutlet weak var editAge: UITextField!
    @IBOutlet weak var editAbout: UITextView!
    @IBOutlet weak var editExperience: UITextView!
    
    var nameEditable:String?
    var ageEditable:String?
    var aboutEditable:String?
    var experienceEditable:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editName.text = nameEditable
        editAge.text = ageEditable
        editAbout.text = aboutEditable
        editExperience.text = experienceEditable
    }
    
    @IBAction func saveSummary(_ sender: UIButton) {
        
        let name = editName.text
        let age = editAge.text
        let about = editAbout.text
        let experience = editExperience.text
        delegate?.fillLabels(name: name!, age: age!, about: about!, experience: experience!)
        navigationController?.popViewController(animated: true)
        saveState(name: name!, age: age!, about: about!,experience:experience!)
        
    }
    
    func saveState(name:String, age:String, about:String,experience:String){
        
        UserDefaults.standard.set(name , forKey: "isNamed")
        UserDefaults.standard.set(age , forKey: "isAged")
        UserDefaults.standard.set(about , forKey: "isAbout")
        UserDefaults.standard.set(experience, forKey: "isExperience")
        UserDefaults.standard.synchronize()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
