//
//  Concentration.swift
//  Concentration
//
//  Created by lwatkins2 on 3/9/18.
//  Copyright © 2018 lwatkins2. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO shuffle cards
    }
    
    func chooseCard(at index: Int) {
        
    }
    
}
