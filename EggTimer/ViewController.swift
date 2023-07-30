//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        switch hardness {
        case "Soft":
            print("You're egg is soft and soft time is \(softTime)")

        case "Medium":
            print("You're egg is medium and medium time is \(mediumTime)")

        case "Hard":
            print("You're egg is hard and hard time is \(hardTime)")

        default:
            print("Have you done something new?")
        }
    }
    
}
