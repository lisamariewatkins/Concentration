//
//  Concentration.swift
//  Concentration
//
//  Created by lwatkins2 on 3/9/18.
//  Copyright © 2018 lwatkins2. All rights reserved.
//

import Foundation

struct Concentration {
    private(set) var cards = [Card]()
    var emojiChoices = [String]()
    var score = 0
    var flipCount = 0
    
    private var indexOfOnlyFaceUpCard: Int? {
        get {
            // look at all cards and find one that is face up or return nil
            return cards.indices.filter { cards[$0].isFaceup}.oneAndOnly
        }
        set {
            // turn all cards face down except card at newValue
            for index in cards.indices {
                cards[index].isFaceup = (index == newValue)
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, theme: String?) {
        reset(numberOfPairsOfCards: numberOfPairsOfCards, theme: theme)
    }
    
    mutating func chooseCard(at index: Int) {
        // if false, will crash (dev env only)
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in cards")
        
        if !cards[index].isMatched {
            if let matchIndex = indexOfOnlyFaceUpCard, matchIndex != index {
                // check if cards match in the game's card array
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    // increment score by 2 for matches
                    score += 2
                } else {
                    // decrement score by 1 if they don't match
                    score -= 1
                }
                cards[index].isFaceup = true
            } else {
                // either no cards or two cards are face up
                indexOfOnlyFaceUpCard = index
            }
            // increment flip count
            flipCount += 1
        }
    }
    
    mutating func reset(numberOfPairsOfCards: Int, theme: String?) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards) < 0")
        // remove existing data
        emojiChoices.removeAll()
        cards.removeAll()
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // shuffle model
        shuffleCards(deckOfCards: &cards)
        // add theme emoji choices
        emojiChoices = Themes.emojis[theme ?? selectRandomTheme()]!
        // reset score and flip count
        score = 0
        flipCount = 0
    }
    
    private mutating func selectRandomTheme() -> String {
        return Themes.keys[Themes.keys.count.arc4random]
    }
    
    private func shuffleCards(deckOfCards: inout [Card]){
        deckOfCards.shuffle()
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
