//
//  ViewController.swift
//  Concentration
//
//  Created by lwatkins2 on 3/1/18.
//  Copyright © 2018 lwatkins2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/ 2)
    
    var flipCount = 0 {
        // runs everytime flipCount changes
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    var emojiChoices = ["👻", "🎃", "👻", "🎃"]
    
    @IBOutlet var cardButtons: [UIButton]!

    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        // if optional is in set state...
        if let cardNumber = cardButtons.index(of: sender) {
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("card not found")
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        }
    }
}

