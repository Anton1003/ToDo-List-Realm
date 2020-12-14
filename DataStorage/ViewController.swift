//
//  ViewController.swift
//  data_storage
//
//  Created by User on 04.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = defaults.string(forKey: "name")
        surnameTextField.text = defaults.string(forKey: "surname")
    }

    @IBAction func saveButton(_ sender: Any) {
        let name = nameTextField.text!
        let surname = surnameTextField.text!
        
        if !name.isEmpty && !surname.isEmpty {
            defaults.set(name, forKey: "name")
            defaults.set(surname, forKey: "surname")
            defaults.synchronize()
        }
    }
    
}

