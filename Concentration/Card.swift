//
//  Card.swift
//  Concentration
//
//  Created by lwatkins2 on 3/9/18.
//  Copyright © 2018 lwatkins2. All rights reserved.
//

import Foundation

// no inheritence, value type
// when you set a var equal to a struct, it copies it
struct Card: Hashable {
    var hashValue: Int {
        return identifier
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceup = false
    var isMatched = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        // can access static vars inside static methods
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
