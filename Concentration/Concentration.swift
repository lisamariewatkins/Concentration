//
//  Concentration.swift
//  Concentration
//
//  Created by lwatkins2 on 3/9/18.
//  Copyright © 2018 lwatkins2. All rights reserved.
//

import Foundation

class Concentration {
    private(set) var cards = [Card]()
    
    private var indexOfOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceup {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceup = (index == newValue)
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards) < 0")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO shuffle cards 
    }
    
    func chooseCard(at index: Int) {
        // if false, will crash (dev env only)
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in cards")
        
        if !cards[index].isMatched {
            if let matchIndex = indexOfOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceup = true
            } else {
                // either no cards or two cards are face up
                indexOfOnlyFaceUpCard = index
            }
        }
    }
    
}
