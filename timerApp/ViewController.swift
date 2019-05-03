//
//  ViewController.swift
//  timerApp
//
//  Created by Michael Kushniriov on 03/05/2019.
//  Copyright © 2019 Michael Kushniriov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: properties
    
    @IBOutlet weak var timerLabelField: UILabel!

    var twentyOne = 1814400;
    var seconds = 0 //This variable will hold a starting value of seconds. It could be any amount above 0.
    var timer = Timer()
    var isTimerRunning = false
    var resumeTapped = false
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        runTimer()
    }
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        seconds -= 1     //This will decrement(count down)the seconds.
        //timerLabelField.text = "\(seconds)" //This will update the label.
        if (seconds < 0) {
            timer.invalidate();
            //Now share with others
        }
        timerLabelField.text = timeString(time: TimeInterval(seconds))
    }
    
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
        if self.resumeTapped == false {
            timer.invalidate()
            self.resumeTapped = true
        } else {
            runTimer()
            self.resumeTapped = false
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        seconds = self.twentyOne    //Here we manually enter the restarting point for the seconds, but it would be wiser to make this a variable or constant.
        //timerLabelField.text = "\(seconds)"
        timerLabelField.text = timeString(time: TimeInterval(seconds))
    }
    
    func timeString(time:TimeInterval) -> String {
        let days = Int(time) / 24 / 3600
        let hours = (Int(time) - (days * 24 * 3600)) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i:%02i", days, hours, minutes, seconds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.seconds = self.twentyOne;
        // Do any additional setup after loading the view, typically from a nib.
    }


}

