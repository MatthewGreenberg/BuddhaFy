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
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var panda: UIImageView!
    
   
    
     var avatar : UIImageView!
    let arrayOfImages = [8, 3]
    
    let userKey = "userId"
    let userXP: Int = 0
    var userPoints = 0
    

    
 
    
    
//    avatar = arrayofImages[0]
    

    
  
    @IBOutlet weak var welcomeToBuddhafy: UILabel!
   
    @IBOutlet weak var MeditateLabel: UIButton!
    
    
    var location = CGPoint(x: 0, y: 0)
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        _ = touches.first as UITouch!
        
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch: UITouch! = touches.first as UITouch!
        location = touch.locationInView(self.view)
        avatar.center = location
    }
    
    
    @IBAction func rotate(sender: AnyObject) {
        UIView.animateWithDuration(1.0, animations: {
            self.avatar.transform = CGAffineTransformMakeRotation((180.0 * CGFloat(M_PI)) / 180.0)
        })
        UIView.animateWithDuration(1.0, animations: {
            self.avatar.transform = CGAffineTransformMakeRotation((0.0 * CGFloat(M_PI)) / 180.0)
        })

    
    }

    
    
    override func viewDidAppear(animated: Bool){
        
        
        
        getUserData()
        
        print(userPoints)
        if userPoints == 1 {
            
            panda.hidden = false
            avatar = panda
            
            
            buddah.hidden = true
            
            print("Hello From 1")
        }
        else if userPoints > 1 {
            
            avatar = buddah
            panda.hidden = true
            buddah.hidden = false
            print("ELSE")
            
        }

        
        self.flipFromLeft(avatar, animationTime: 1.0)
        
        let pulseAnimation = CABasicAnimation(keyPath: "opacity")
        pulseAnimation.duration = 1.0
        pulseAnimation.fromValue = 0.2
        pulseAnimation.toValue = 0.5
        pulseAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = FLT_MAX
        self.Arrow.layer.addAnimation(pulseAnimation, forKey: nil)
        
        
        

    }

    
    // found repeate but this will not animate as I want.
    //UIView.animateWithDuration(2.0, delay: 0.2, options: UIViewAnimationOptions.Repeat, animations: {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUserData()
        
         userPoints = NSUserDefaults().valueForKey("userPoints") as! Int
     
            buddah.hidden = true 
            avatar = panda

        
            
     
      
       
        
       
        
        
        //Animation
        avatar.center = CGPointMake(160, 330)
        MeditateLabel.alpha = 0
        UIView.animateWithDuration(1.0,
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
         //segue to the main page
        if let value =  NSUserDefaults.standardUserDefaults().valueForKey(userKey) {
            
          signUpButton.alpha = 0
            
        }
            
        else {
            
            //segue to the login page
            
        }
        
        
        
        NSUserDefaults.standardUserDefaults().setValue("Some Value!", forKey: userKey)
        
            performSegueWithIdentifier("segueToSignIn", sender: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dropFromTop(view: UIView, animationTime: Float) {
        let animation:CATransition = CATransition()
        animation.duration = CFTimeInterval(animationTime)
        animation.type = "moveIn"
        animation.timingFunction = CAMediaTimingFunction(name:"easeInEaseOut")
        animation.subtype = "fromBottom"
        animation.fillMode = "forwards"
        view.layer.addAnimation(animation, forKey: nil)
    }
    
    func flipFromLeft(view: UIView, animationTime: Float) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
        UIView.setAnimationDuration(NSTimeInterval(animationTime))
        UIView.setAnimationTransition(UIViewAnimationTransition.FlipFromLeft, forView: view, cache: false)
        UIView.commitAnimations()
    }
    
    func getUserData() {
        
        
        
        let current_user_id = NSUserDefaults.standardUserDefaults().valueForKey("user_id")!
        
        
        
        let urlPath : String = "https://immense-escarpment-4758.herokuapp.com/users/\(current_user_id).json"
        
        
        
        let url: NSURL = NSURL(string: urlPath)!
        
        
        
        let request : NSMutableURLRequest = NSMutableURLRequest(URL: url)
        
        
        
        request.HTTPMethod = "GET"
        
        
        
        let queue:NSOperationQueue = NSOperationQueue()
        
        
        
        NSURLConnection.sendAsynchronousRequest(request, queue: queue, completionHandler:{ (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
            
            print("data raw")
            
            print(data!)
            
            print("data as string?")
            
            let newData = NSString(data: data!, encoding: NSUTF8StringEncoding)!.componentsSeparatedByString(",")
            
            self.userPoints = self.sanitizeXP(newData[2])
            
            
        })
    }
    
    func sanitizeName(name: String) -> String {
        
        let string = name as NSString
        
        return string.substringWithRange(NSRange(location: 2, length: string.length-3))
        
    }
    
    func sanitizeLevel(level : String) -> Int {
        
        return Int(5)
    }
    
    func sanitizeXP(xPPoints : String) -> Int {
        
        let xPPointsString = xPPoints as NSString
        
        let subset = xPPointsString.substringWithRange(NSRange(location: 0, length: xPPointsString.length-1))
        
        return Int(subset)!
        
        
    }
    
    
}

