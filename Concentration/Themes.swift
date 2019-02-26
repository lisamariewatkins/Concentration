//
//  Themes.swift
//  Concentration
//
//  Created by Lisa Watkins on 2/25/19.
//  Copyright © 2019 lwatkins2. All rights reserved.
//

import Foundation

struct Constants {
    static let animals = "Animals"
    static let bugs = "Bugs"
    static let plants = "Plants"
    static let flowers = "Flowers"
    static let weather = "Weather"
}

struct Themes {
    static let keys = [Constants.animals, Constants.bugs, Constants.plants, Constants.flowers, Constants.weather]
    
    static let emojis: Dictionary<String, [String]> =
        [Constants.animals: ["🐶", "🐱", "🐭", "🐹", "🐰", "🐼", "🐨", "🦁" ],
        Constants.bugs: ["🐝", "🐛", "🦋", "🐞", "🐜", "🦟", "🦗", "🕷"],
        Constants.plants: ["🌳", "🌴", "🌱", "🌿", "☘️", "🍀", "🎍", "🎋"],
        Constants.flowers: ["💐", "🌷", "🌹", "🥀", "🌺", "🌸", "🌼", "🌻"],
        Constants.weather: ["🌪", "🌈", "☀️", "🌤", "☁️", "🌧", "🌨", "🌦"]]
}
