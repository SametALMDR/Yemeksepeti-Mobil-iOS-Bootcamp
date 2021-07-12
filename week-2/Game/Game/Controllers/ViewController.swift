//
//  ViewController.swift
//  Game
//
//  Created by Macbook on 2.07.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var bottlePositionLabel: UILabel!
    @IBOutlet weak var bottlePositionSlider: UISlider!
    @IBOutlet var angleLabel: UIView!
    @IBOutlet weak var angleSlider: UISlider!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    
    var player = Player(nickname: "samet", score: 0)
    var cannon = Cannon(teta: 45, speed: 50)
    var bottle = Bottle(location: 750, delta: 1)
            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func throwButtonClicked(_ sender: Any) {
        
    }
    

}

