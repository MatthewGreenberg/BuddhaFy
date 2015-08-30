//
//  TimerViewController.swift
//  Leveled
//
//  Created by Matthew on 8/29/15.
//  Copyright © 2015 Matthew. All rights reserved.
//

import UIKit
import AVFoundation


class TimerViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
//    let colorWheel = ColorWheel()
    
    //the time now
    var startTime = NSTimeInterval()
    
    //actual timer
    var timer = NSTimer()
    
    
    

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var counterTime: UILabel!
    
    
    var ButtonAudioUrl = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("buddha", ofType: "mp3")!)
    
   var ButtonAudioPLayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       try! ButtonAudioPLayer = AVAudioPlayer(contentsOfURL: ButtonAudioUrl)
        self.startButton.alpha = 0
        self.stopButton.alpha = 0
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    //Start Button Fades In
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(1.0, animations: {void in self.startButton.alpha = 1.0})
        
    }
    
    
    
    //func that determines the timer moving
  
    

    func updateTime() {
        
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        //Find the difference between current time and start time.
        
        var elapsedTime: NSTimeInterval = currentTime - startTime
        
        //calculate the minutes in elapsed time.
        
        let minutes = UInt8(elapsedTime / 60.0)
        
        elapsedTime -= (NSTimeInterval(minutes) * 60)
        
        //calculate the seconds in elapsed time.
        
        let seconds = UInt8(elapsedTime)
        
        elapsedTime -= NSTimeInterval(seconds)
        
        //find out the fraction of milliseconds to be displayed.
        
        _ = UInt8(elapsedTime * 100)
        
        //add the leading zero for minutes, seconds and millseconds and store them as string constants
        
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        
        //concatenate minuets, seconds and milliseconds as assign it to the UILabel
        
        counterTime.text = "\(strMinutes):\(strSeconds)"
    }
    
    
    
    
    
    //starts timer
    
    @IBAction func startTimer() {
        
        
        //change color
//        let randomColor = colorWheel.randomColor()
//        view.backgroundColor = randomColor
//        startButton.titleLabel?.textColor = randomColor
//        stopButton.titleLabel?.textColor = randomColor
        
        if !timer.valid {
        let aSelector : Selector = "updateTime"
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
        startTime = NSDate.timeIntervalSinceReferenceDate()
        }
        
        
        //animate button
        UIView.animateWithDuration(1.0,
            delay: 0,
            options: UIViewAnimationOptions.CurveLinear,
            animations: {
                self.startButton.alpha = 0
            }, completion: nil)
        UIView.animateWithDuration(0.5,
            delay: 1.0,
            options: UIViewAnimationOptions.CurveLinear,
            animations: {
                self.stopButton.alpha = 1.0
            }, completion: nil)
        
        
       //sound
        
        ButtonAudioPLayer.play()
        
        
        

    
    }
    
    
    //stop timer
    @IBAction func stopTimer() {
        
//        let randomColor = colorWheel.randomColor()
//        view.backgroundColor = randomColor
//        startButton.titleLabel?.textColor = randomColor
//        stopButton.titleLabel?.textColor = randomColor
        
        timer.invalidate()
        counterTime.text = "00.00"
        
        
        
        UIView.animateWithDuration(1.0,
            delay: 0,
            options: UIViewAnimationOptions.CurveLinear,
            animations: {
            self.stopButton.alpha = 0
            }, completion: nil)
        
        
        UIView.animateWithDuration(1.0,
            delay: 1.0,
            options: UIViewAnimationOptions.CurveLinear,
            animations: {
                self.startButton.alpha = 1.0
            }, completion: nil)
       

    }
}


