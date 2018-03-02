//
//  ViewController.swift
//  Concentration
//
//  Created by lwatkins2 on 3/1/18.
//  Copyright © 2018 lwatkins2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var white = true
    
    @IBOutlet weak var button1: UIButton!
    
    @IBAction func flipCard(_ sender: Any) {
        if white {
            button1.backgroundColor = UIColor.blue
            white = false
        } else {
            button1.backgroundColor = UIColor.white
            white = true
        }
    }
    
}

