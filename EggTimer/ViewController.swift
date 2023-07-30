//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var eggTimes : [String : Int] = ["Soft" : 5, "Medium" : 7, "Hard" : 12]
    var seconds : Int = 0
    var timer : Timer? = nil
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        seconds = eggTimes[hardness]! * 60
        print("You're egg is \(hardness) and it takes \(eggTimes[hardness]!) minutes to boil.")
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        

    }
    
    @objc func fireTimer() {
        print(seconds)
        seconds -= 1

        if seconds == 0 {
            print("timer ends")
            timer?.invalidate()
        }
    }
    
}
