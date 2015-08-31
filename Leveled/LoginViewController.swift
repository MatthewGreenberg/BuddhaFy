//
//  LoginViewController.swift
//  Leveled
//
//  Created by Andrew  Carr on 8/31/15.
//  Copyright © 2015 Matthew. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {
    
    var userInfo : NSString = ""

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getRequest() {
        getUserData()
        print(userInfo)
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
    
    func loginUser(){
        let urlPath : String = "http://localhost:3000/users/create"
    }

}
