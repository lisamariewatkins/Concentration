//
//  ViewController.swift
//  Concentration
//
//  Created by lwatkins2 on 3/1/18.
//  Copyright © 2018 lwatkins2. All rights reserved.
//

import UIKit

private struct UIConstants {
    static let flipCountLabelText = "Flip Count: "
    static let scoreLabelText = "Score: "
}

class ViewController: UIViewController {
    // won't initialize til something tries to use game (lazy)
    private lazy var game: Concentration =
        Concentration(numberOfPairsOfCards: numberofPairsOfCards)
    
    var numberofPairsOfCards: Int {
        return (cardButtons.count) / 2
    }
    
    private var emoji = [Card:String]()
    
    @IBOutlet private var cardButtons: [UIButton]!

    @IBOutlet private weak var flipCountLabel: UILabel! {
        didSet {
            updateLabel(labelText: UIConstants.flipCountLabelText, value: 0, label: flipCountLabel)
        }
    }
    
    @IBOutlet weak var scoreLabel: UILabel! {
        didSet {
            updateLabel(labelText: UIConstants.scoreLabelText, value: 0, label: scoreLabel)
        }
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        // if optional is in set state...
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("card not found")
        }
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        game.reset(numberOfPairsOfCards: numberofPairsOfCards)
        emoji = [Card:String]()
        updateViewFromModel()
    }
    
    private func updateLabel(labelText: String, value: Int, label: UILabel) {
        let attributes: [NSAttributedStringKey:Any] = [
            .strokeWidth : 5.0,
            .strokeColor : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        ]
        let attributedString = NSAttributedString(string: labelText + String(value), attributes: attributes)
        label.attributedText = attributedString
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceup {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
        }
        // update score
        updateLabel(labelText: UIConstants.scoreLabelText, value: game.score, label: scoreLabel)
        // update flip count
        updateLabel(labelText: UIConstants.flipCountLabelText, value: game.flipCount, label: flipCountLabel)
    }
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, game.emojiChoices.count > 0 {
            emoji[card] = game.emojiChoices.remove(at: game.emojiChoices.count.arc4random)
        }
        return emoji[card] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}
