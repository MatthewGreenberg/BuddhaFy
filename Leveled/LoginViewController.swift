//
//  LoginViewController.swift
//  Leveled
//
//  Created by Matthew on 9/1/15.
//  Copyright © 2015 Matthew. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    
    var userInfo : NSString = ""
    
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!

    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    

    }
    
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
    
    
    
    
    
    

    @IBAction func signUpBttn() {
 
        
        signUpUser()
        
    }
    

    
    func signUpUser() {
        
        let urlPath : String = "http://localhost:3000/users.json/"
        
        let url : NSURL = NSURL(string: urlPath)!
        
        let request : NSMutableURLRequest = NSMutableURLRequest(URL:url)
        
        request.HTTPMethod = "POST"
        
        
        
        let username = usernameField.text
        
        let password = passwordField.text
        
        
        
        let dataString = "user[username]=" + username! + "&" + "user[password]=" + password!
        
        
        
        let requestBodyData = (dataString as NSString).dataUsingEncoding(NSUTF8StringEncoding)
        
        request.HTTPBody = requestBodyData
        
        
        
        let queue:NSOperationQueue = NSOperationQueue()
        
        
        
        NSURLConnection.sendAsynchronousRequest(request, queue: queue, completionHandler: {(response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
           
            let newData: NSString = NSString(data: data!, encoding: NSUTF8StringEncoding)!
            
            
            
            
            let stringArray = newData.componentsSeparatedByCharactersInSet(NSCharacterSet.decimalDigitCharacterSet().invertedSet)
            
            //            set core data
            
            
            
            print(stringArray[stringArray.count-2])
            
            
            
            
            
        })
        
        
        
    }
    
    
    
    func getUserData() {
        
        var userData : NSString = ""
        
        let urlPath : String = "http://localhost:3000/users/1.json"
        
        let url: NSURL = NSURL(string: urlPath)!
        
        let request : NSMutableURLRequest = NSMutableURLRequest(URL: url)
        
        
        
        request.HTTPMethod = "GET"
        
        
        
        let queue:NSOperationQueue = NSOperationQueue()
        
        
        
        NSURLConnection.sendAsynchronousRequest(request, queue: queue, completionHandler:{ (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
            
            self.userInfo = (NSString(data: data!, encoding: NSUTF8StringEncoding))!
            
        })
        
    }
    
    
    
    
    
    
    
}
