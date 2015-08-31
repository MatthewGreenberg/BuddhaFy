//
//  TimePickerViewController.swift
//  Leveled
//
//  Created by Joshua Jones on 8/31/15.
//  Copyright © 2015 Matthew. All rights reserved.
//

import UIKit

class TimePickerViewController: UIViewController {
    

    @IBOutlet weak var durationButton5: UIButton!
    @IBOutlet weak var durationButton10: UIButton!
    @IBOutlet weak var durationButton15: UIButton!
    @IBOutlet weak var durationButton20: UIButton!
    @IBOutlet weak var durationButton25: UIButton!
    @IBOutlet weak var durationButton30: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        durationButton5.layer.cornerRadius = 5
        durationButton10.layer.cornerRadius = 5
        durationButton15.layer.cornerRadius = 5
        durationButton20.layer.cornerRadius = 5
        durationButton25.layer.cornerRadius = 5
        durationButton30.layer.cornerRadius = 5
        
      
   
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "5 minutes" {
            let timerViewController = segue.destinationViewController as! TimerViewController
            timerViewController.timerLabelText = "05:00"
            timerViewController.timeCount = Double(300.0)
            timerViewController.timerDuration = Double(300.0)
            
        }
        else if segue.identifier == "10 minutes" {
            
                let timerViewController = segue.destinationViewController as! TimerViewController
                timerViewController.timerLabelText = "10:00"
                timerViewController.timeCount = Double(600.0)
                timerViewController.timerDuration = Double(600.0)
        }
        else if segue.identifier == "15 minutes" {
            
            let timerViewController = segue.destinationViewController as! TimerViewController
            timerViewController.timerLabelText = "15:00"
            timerViewController.timeCount = Double(900.0)
            timerViewController.timerDuration = Double(900.0)
        }
        else if segue.identifier == "20 minutes" {
            
            let timerViewController = segue.destinationViewController as! TimerViewController
            timerViewController.timerLabelText = "20:00"
            timerViewController.timeCount = Double(1200.0)
            timerViewController.timerDuration = Double(1200.0)
        }
        else if segue.identifier == "25 minutes" {
            
            let timerViewController = segue.destinationViewController as! TimerViewController
            timerViewController.timerLabelText = "25:00"
            timerViewController.timeCount = Double(1500.0)
            timerViewController.timerDuration = Double(1500.0)
        }
        else if segue.identifier == "30 minutes" {
            
            let timerViewController = segue.destinationViewController as! TimerViewController
            timerViewController.timerLabelText = "30:00"
            timerViewController.timeCount = Double(1800.0)
            timerViewController.timerDuration = Double(1800.0)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
