//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var mainMessage: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var eggTimes : [String : Int] = ["Soft" : 3, "Medium" : 5, "Hard" : 7]
    var seconds : Int = 0
    var timer : Timer? = nil // alternatively var timer = Timer() so we don't have to use optionals
    var hardness : String = ""
    var audioPlayer: AVAudioPlayer?
    
    @IBAction func hardnessPressed(_ sender: UIButton) {

        timer?.invalidate()
        hardness = sender.currentTitle!
//        seconds = eggTimes[hardness]! * 60
        
        print("You're egg is \(hardness) and it takes \(eggTimes[hardness]!) minutes to boil.")
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }

    @objc func fireTimer() {
        print(seconds)
        seconds += 1
        
        var forProgressBar : Float = Float(seconds) / Float((eggTimes[hardness]! * 60))
        progressBar.setProgress(forProgressBar, animated: true) // progressBar.progress = value should also work, had made a wrong @IBOutlet so it didn't work before and found setProgress because of it. We have animation now at least
        if seconds == eggTimes[hardness]! * 60 {
            print("timer ends")
            mainMessage.text = "\(hardness) egg has finished boiling"
            playAlarm()
            timer?.invalidate()
        }
    }
    
    func playAlarm() {
        do {
            // Check if the sound file is in the bundle
            if let fileURL = Bundle.main.path(forResource: "alarm_sound", ofType: "mp3") {
                // Translating the file URL to 'Data' which the AVAudioPlayer understands
                let soundData = NSData(contentsOfFile: fileURL)
                // Creating the player
                audioPlayer = try AVAudioPlayer(data: soundData! as Data)
                audioPlayer?.play()
            } else {
                print("No file with specified name exists")
            }
        } catch let error {
            print("Can't play the audio file failed with an error \(error.localizedDescription)")
        }

    }
}

