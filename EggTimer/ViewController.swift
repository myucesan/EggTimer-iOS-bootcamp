//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12
    
    var eggTimes : [String : Int] = ["Soft" : 5, "Medium" : 7, "Hard" : 12]
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        print("You're egg is \(hardness) and it takes \(eggTimes[hardness]!) to boil.")
    }
    
}
