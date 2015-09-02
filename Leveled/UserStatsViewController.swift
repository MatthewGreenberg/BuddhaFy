//

//  UserStatsViewController.swift

//  Leveled

//

//  Created by Andrew  Carr on 9/1/15.

//  Copyright © 2015 Matthew. All rights reserved.

//



import UIKit

import Foundation





class UserStatsViewController: UIViewController {
    
    
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    
    
    var userInfo : NSString = ""
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        getUserData()
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
    
    func getUserData() {
        
        
        
        let current_user_id = NSUserDefaults.standardUserDefaults().valueForKey("user_id")!
        
        
        
        let urlPath : String = "http://localhost:3000/users/\(current_user_id).json"
        
        
        
        let url: NSURL = NSURL(string: urlPath)!
        
        
        
        let request : NSMutableURLRequest = NSMutableURLRequest(URL: url)
        
        
        
        request.HTTPMethod = "GET"
        
        
        
        let queue:NSOperationQueue = NSOperationQueue()
        
        
        
        NSURLConnection.sendAsynchronousRequest(request, queue: queue, completionHandler:{ (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
            
            print("data raw")
            
            print(data!)
            
            print("data as string?")
            
            let newData = NSString(data: data!, encoding: NSUTF8StringEncoding)!.componentsSeparatedByString(",")
            

            let userName = self.sanitizeName((newData[0]))

            let userLevelRaw = self.sanitizeLevel(newData[1])

            let userXpRaw = self.sanitizeXP(newData[2])
 
            print(userName)
            
            print(userLevelRaw)
            
            print(userXpRaw)
            
            
            
        })
        
    }
    
    
    
    func sanitizeName(name: String) -> String {
        
        let string = name as NSString
        
        return string.substringWithRange(NSRange(location: 2, length: string.length-3))
        
    }
    
    func sanitizeLevel(level : String) -> Int {
        
        return Int(level)!
        
    }
    func sanitizeXP(xPPoints : String) -> Int {
        
        let xPPointsString = xPPoints as NSString
        
        let subset = xPPointsString.substringWithRange(NSRange(location: 0, length: xPPointsString.length-1))
        
        return sanitizeLevel(subset)
        
    }
    
    
    
}