//
//  ViewController.swift
//  SwiftPizzaTimer
//
//  Created by Steven Lipton on 4/22/15.
//  Copyright (c) 2015 MakeAppPie.Com. All rights reserved.
//
//  Iteration 1 of the timer - a single time
//

import UIKit
import AVFoundation

class TimerViewController: UIViewController {
    //iteration 2 of the timer
    
    //MARK: - Outlets and properties
    
    //color and sound 
    var audioPlayer = AVAudioPlayer()
    let colorWheel = ColorWheel()
    var ButtonAudioUrl = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("buddha", ofType: "mp3")!)
    var timerLabelText = ""
    
    var timerDuration : Double = 0.0
    
    @IBOutlet weak var countingDown: UISwitch!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var Pause: UIButton!
    
    @IBOutlet weak var Resume: UIButton!
    
    var ButtonAudioPLayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 10
        stopButton.layer.cornerRadius = 10
        
        try! ButtonAudioPLayer = AVAudioPlayer(contentsOfURL: ButtonAudioUrl)
        self.startButton.alpha = 0
        self.stopButton.alpha = 0
        self.Resume.alpha = 0
        let initialValue = timeCount
        timerLabel.text = timeString(initialValue)
        timerLabel.text = timerLabelText

        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(1.0, animations: {void in self.startButton.alpha = 1.0})
        
        
    }

    
    

    var timer = NSTimer() //make a timer variable, but do do anything yet
    let timeInterval:NSTimeInterval = 0.1
    let timerEnd:NSTimeInterval = 0.0
    var timeCount:NSTimeInterval = 300.0
    //MARK: - Actions
    
    @IBAction func startTimer(sender: UIButton) {
        
        ButtonAudioPLayer.play()
        
        let randomColor = colorWheel.randomColor()
        view.backgroundColor = randomColor
        startButton.setTitleColor(randomColor, forState: UIControlState.Normal)
        stopButton.setTitleColor(randomColor, forState: UIControlState.Normal)
        
        
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
        
        UIView.animateWithDuration(1.0, animations: {void in self.startButton.alpha = 0.0})
        UIView.animateWithDuration(1.0, animations: {void in self.stopButton.alpha = 1.0})

        if !timer.valid{ //prevent more than one timer on the thread
            timerLabel.text = timeString(timeCount)
            timer = NSTimer.scheduledTimerWithTimeInterval(timeInterval,
                target: self,
                selector: "timerDidEnd:",
                userInfo: "Meditation Complete",
                repeats: true) //repeating timer in the second iteration
        }
    }
    
    @IBAction func countingDown(sender: UISwitch) {
        if !timer.valid{ //if we stopped an
            resetTimeCount()
        }
    }
    @IBAction func stopTimer(sender: UIButton) {
        //timerLabel.text = "Timer Stopped"
        timer.invalidate()
    }
    
    @IBAction func resetTimer(sender: UIButton) {
        
        UIView.animateWithDuration(0.7,
            delay: 0,
            options: UIViewAnimationOptions.CurveLinear,
            animations: {
                self.Pause.alpha = 0
            }, completion: nil)
        
        UIView.animateWithDuration(0.7,
            delay: 0.7,
            options: UIViewAnimationOptions.CurveLinear,
            animations: {
                self.Resume.alpha = 1.0
            }, completion: nil)

        timer.invalidate()
        resetTimeCount()
        timerLabel.text = timeString(timeCount)
    }
    
    //MARK: - Instance Methods
    func resetTimeCount(){
        if countingDown.on{
            timeCount = timeCount + 0
        }
    }
    
    func timeString(time:NSTimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i",minutes,seconds)
    }
    
    func timerDidEnd(timer:NSTimer){
        

        if countingDown.on{
            //timer that counts down
            timeCount = timeCount - timeInterval
            if timeCount <= 0 {  //test for target time reached.
                
                
                timer.invalidate()
                ButtonAudioPLayer.play()
            } else { //update the time on the clock if not reached
                timerLabel.text = timeString(timeCount)
            }
            
        } else {
            //timer that counts up
            timeCount = timeCount + timeInterval
            if timeCount >= timerEnd{  //test for target time reached.
                timerLabel.text = "Pizza Ready!!"
                timer.invalidate()
            } else { //update the time on the clock if not reached
                timerLabel.text = timeString(timeCount)
            }
            
        }
        
    }
    
    
    @IBAction func resume() {
        
        
        
        UIView.animateWithDuration(0.7,
            delay: 0,
            options: UIViewAnimationOptions.CurveLinear,
            animations: {
                self.Resume.alpha = 0
            }, completion: nil)

        UIView.animateWithDuration(0.7,
            delay: 0.7,
            options: UIViewAnimationOptions.CurveLinear,
            animations: {
                self.Pause.alpha = 1.0
            }, completion: nil)

        
        let randomColor = colorWheel.randomColor()
        view.backgroundColor = randomColor
        startButton.setTitleColor(randomColor, forState: UIControlState.Normal)
        stopButton.setTitleColor(randomColor, forState: UIControlState.Normal)
        
        
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
        
        UIView.animateWithDuration(1.0, animations: {void in self.startButton.alpha = 0.0})
        UIView.animateWithDuration(1.0, animations: {void in self.stopButton.alpha = 1.0})
        
        if !timer.valid{ //prevent more than one timer on the thread
            timerLabel.text = timeString(timeCount)
            timer = NSTimer.scheduledTimerWithTimeInterval(timeInterval,
                target: self,
                selector: "timerDidEnd:",
                userInfo: "Meditation Complete",
                repeats: true) //repeating timer in the second iteration
        }

        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMeditationStats" {
            let statsViewController = segue.destinationViewController as! StatsViewController

            
            statsViewController.segueIntededTime = timerDuration
            
            statsViewController.segueCompletedTime = timeCount
            
            
            
            
            
             statsViewController.segueStatsLabel = timeString( timerDuration - timeCount)
            var myIntValue = Int((timerDuration - timeCount) / 60)
//            
            if timeCount == 0 {
                    myIntValue +=  10
            }
            
            
            
            let preGamePoints = NSUserDefaults().valueForKey("userPoints")
            
            myIntValue += preGamePoints as! Int
            
            myIntValue = myIntValue / 2 
            
           
            NSUserDefaults().setValue(myIntValue, forKey: "userPoints")
            
            
            if myIntValue == 0 {
             statsViewController.segueXPLabel = "No XP points :( "
                
            }
            else if myIntValue == 1 {
            statsViewController.segueXPLabel = "\(myIntValue) XP point!"
            }
            else {
                
                statsViewController.segueXPLabel = "\(myIntValue) XP points!"

            
            }
            
        }
    }
    
    
    
    
    
}










