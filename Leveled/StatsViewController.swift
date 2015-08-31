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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OkButton.layer.cornerRadius = 5
        statsLabel.text = segueStatsLabel
        xpPoints.text = segueXPLabel
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
       
}
