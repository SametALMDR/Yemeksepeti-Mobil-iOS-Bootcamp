//
//  UserDefaultsViewController.swift
//  Week-3
//
//  Created by Kerim Caglar on 4.07.2021.
//

import UIKit

class UserDefaultsViewController: UIViewController {

    
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var infoTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        infoLabel.text = UserDefaults.standard.value(forKey: "info") as? String
    }
    
    @IBAction func saveInfo(_ sender: Any) {
        let info = infoTextField.text
        UserDefaults.standard.set(info, forKey: "info")
        infoTextField.text = ""
        infoLabel.text = info
    }
    
    

}
