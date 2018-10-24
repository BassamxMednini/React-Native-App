//
//  ViewController.swift
//  iOSstopWatch
//
//  Created by Bassam Mednini on 24.10.18.
//  Copyright © 2018 Bassam Mednini. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    
    var timer: Timer?
    var isStarted = false
    var counter = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func updateTimerLabel() {
        counter += 0.1
        timerLabel.text = String(round(counter * 10) / 10)
    }

    @IBAction func startStopButtonTouch(_ sender: UIButton) {
        
        if isStarted {
            timer?.invalidate()
            isStarted = false
            startStopButton.setTitle("Start", for: .normal)
        } else {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimerLabel), userInfo: nil, repeats: true)
            isStarted = true
            startStopButton.setTitle("Stop", for: .normal)
        }
        
    }
    
    
    @IBAction func resetTouch(_ sender: UIButton) {

        if isStarted {
            timer?.invalidate()
            startStopButton.setTitle("Start", for: .normal)
            timerLabel.text = "0.0"
            isStarted = false
        } else {
            timer?.invalidate()
            timerLabel.text = "0.0"
        }
        
    }
    
}

