//
//  UserData.swift
//  Leveled
//
//  Created by Andrew  Carr on 9/1/15.
//  Copyright © 2015 Matthew. All rights reserved.
//

import Foundation

class User {
    let id: Int
    let username: String
    let level: Int
    let xp: Int
    
    init(data : NSDictionary){
        self.id = data["id"] as! Int
        self.username = data["username"] as! String
        self.level = data["level"] as! Int
        self.xp = data["xp"] as! Int
    
    }
}
