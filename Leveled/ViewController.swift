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

    @IBOutlet weak var buddah: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
   
    
    
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

    
      

    
    
    
    


    

    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buddah.center = CGPointMake(160, 330)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

