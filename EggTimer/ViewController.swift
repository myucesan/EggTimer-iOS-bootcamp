//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainMessage: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var eggTimes : [String : Int] = ["Soft" : 1, "Medium" : 7, "Hard" : 12]
    var seconds : Int = 0
    var timer : Timer? = nil // alternatively var timer = Timer() so we don't have to use optionals
    var hardness : String = ""
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        progressBar.setProgress(1, animated: true) // progressBar.progress = value should also work, had made a wrong @IBOutlet so it didn't work before and found setProgress because of it. We have animation now at least
        timer?.invalidate()
        hardness = sender.currentTitle!
        seconds = eggTimes[hardness]! * 60
        print("You're egg is \(hardness) and it takes \(eggTimes[hardness]!) minutes to boil.")
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }

    @objc func fireTimer() {
        print(seconds)
        seconds -= 1
        
        if seconds == 0 {
            print("timer ends")
            mainMessage.text = "\(hardness) egg has finished boiling"
            timer?.invalidate()
        }
    }
}
