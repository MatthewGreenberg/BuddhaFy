//
//  StatsViewController.swift
//  Leveled
//
//  Created by Matthew on 8/30/15.
//  Copyright © 2015 Matthew. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    @IBOutlet weak var xpPoints: UILabel!
    @IBOutlet weak var OkButton: UIButton!
    @IBOutlet weak var statsLabel: UILabel!
    var segueStatsLabel: String = ""
    var segueXPLabel : String = ""
    var segueIntededTime : Double = 0.00
    var segueCompletedTime : Double = 0.00
//    var xpPoints: Int = 0
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OkButton.layer.cornerRadius = 10
        
        print(segueStatsLabel)
        print(segueXPLabel)
        
        let user_id = NSUserDefaults().valueForKey("user_id")!
        print(user_id)
        
        createGame()

        statsLabel.text = segueStatsLabel
        xpPoints.text = segueXPLabel

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    func createGame(){
        
        let user_id = NSUserDefaults().valueForKey("user_id")! as! String
        
        let urlPath : String = "http://localhost:3000/users/"+user_id+"/rounds.json"
        
        let url : NSURL = NSURL(string: urlPath)!
        
        let request : NSMutableURLRequest = NSMutableURLRequest(URL:url)
        
        request.HTTPMethod = "POST"
        
        var actualCompleted = segueIntededTime - segueCompletedTime
        
        var intendedTime : String = String(format:"%1.f",segueIntededTime)
        
        var completedTime: String = String(format:"%1.f",actualCompleted)
        
        let dataString = "round[user_id]=" + user_id + "&round[intended_time]=" + intendedTime+"&round[completed_time]="+completedTime
        
        let requestBodyData = (dataString as NSString).dataUsingEncoding(NSUTF8StringEncoding)
        
        request.HTTPBody = requestBodyData
        
        let queue : NSOperationQueue = NSOperationQueue()
        
        NSURLConnection.sendAsynchronousRequest(request, queue: queue, completionHandler: {(response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
            let dataResponse : NSString = NSString(data: data!, encoding: NSUTF8StringEncoding)!
            print("hello from inside")
            print(dataResponse)
            
                      
        })
        
    
    }
}
