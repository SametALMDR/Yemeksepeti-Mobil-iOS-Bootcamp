//
//  KeychainViewController.swift
//  Week-3
//
//  Created by Kerim Caglar on 4.07.2021.
//

import UIKit
import KeychainAccess

class KeychainViewController: UIViewController {

    @IBOutlet weak var dataLbl: UILabel!
    @IBOutlet weak var dataTextField: UITextField!
    
    let keychain = Keychain(service: "com.kerimcaglar.Week-3")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dataLbl.text = keychain["labelValue"]
    }
    
    @IBAction func saveData(_ sender: Any) {
        keychain["labelValue"] = dataTextField.text
        dataLbl.text = dataTextField.text
        
    }
    
    @IBAction func clearData(_ sender: Any) {
        keychain["labelValue"] = nil
    }
    
}
