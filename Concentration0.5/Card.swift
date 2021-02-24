//
//  Card.swift
//  Concentration0.5
//
//  Created by Ryan Hong on 2/5/20.
//  Copyright © 2020 Ryan Hong. All rights reserved.
//

import Foundation
struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    //var theEmoji: [String]
    //var backgroundColor: UIColor
    //var cardColor: UIColor
    //public var score: Int
    //var gameScore = 0
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
        //self.score = 0
    }
    //TODO: Shuffle Card
}


