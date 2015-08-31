//
//  TimePickerViewController.swift
//  Leveled
//
//  Created by Joshua Jones on 8/31/15.
//  Copyright © 2015 Matthew. All rights reserved.
//

import UIKit

class TimePickerViewController: UIViewController {
    

    @IBOutlet weak var durationButtonFive: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
   
        

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
            timerViewController.timeCount = Double(600.0)
            
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
