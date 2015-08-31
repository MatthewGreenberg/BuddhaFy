//
//  ViewController.swift
//  Leveled
//
//  Created by Matthew on 8/29/15.
//  Copyright © 2015 Matthew. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    
    @IBOutlet weak var Arrow: UIImageView!
    @IBOutlet weak var buddah: UIImageView!
    
  
    @IBOutlet weak var welcomeToBuddhafy: UILabel!
   
    @IBOutlet weak var MeditateLabel: UIButton!
    
    
    var location = CGPoint(x: 0, y: 0)
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        _ = touches.first as UITouch!
        

        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch: UITouch! = touches.first as UITouch!
        
        location = touch.locationInView(self.view)
        
        buddah.center = location

    }
    
    
    @IBAction func rotate(sender: AnyObject) {
        UIView.animateWithDuration(1.0, animations: {
            self.buddah.transform = CGAffineTransformMakeRotation((180.0 * CGFloat(M_PI)) / 180.0)
        })

    
    }

    
    
    override func viewDidAppear(animated: Bool) {
        let pulseAnimation = CABasicAnimation(keyPath: "opacity")
        pulseAnimation.duration = 1.5
        pulseAnimation.fromValue = 0.2
        pulseAnimation.toValue = 0.5
        pulseAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = FLT_MAX
        self.Arrow.layer.addAnimation(pulseAnimation, forKey: nil)

    }
    
    
    
 
    


    

    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buddah.center = CGPointMake(160, 330)
        MeditateLabel.alpha = 0
        
       
      
        
        UIView.animateWithDuration(2.0,
            delay: 1.8,
            options: UIViewAnimationOptions.CurveLinear,
            animations: {
                self.MeditateLabel.alpha = 1
            }, completion: nil)
        
        
        UIView.animateWithDuration(2.0,
            delay: 1.8,
            options: UIViewAnimationOptions.CurveLinear,
            animations: {
                self.welcomeToBuddhafy.alpha = 0
            }, completion: nil)

        
        


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

