//
//  LoginViewController.swift
//  Leveled
//
//  Created by Matthew on 9/1/15.
//  Copyright © 2015 Matthew. All rights reserved.
//

import UIKit

let kUserIDKey = "user_id"

class LoginViewController: UIViewController {
    

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!

    override func viewDidLoad() {
        
        super.viewDidLoad()

        signUpButton.layer.cornerRadius = 5
        
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        NSUserDefaults().setValue(1, forKey: "userPoints")
    }
    
    //Calls this function when the tap is recognized.
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
     
        


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
            var user_id = stringArray[stringArray.count-2]
            NSUserDefaults.standardUserDefaults().setValue(user_id, forKey: kUserIDKey)
        })
    }
}
