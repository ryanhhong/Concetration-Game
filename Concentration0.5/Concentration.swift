//
//  Concentration.swift
//  Concentration0.5
//
//  Created by Ryan Hong on 2/5/20.
//  Copyright © 2020 Ryan Hong. All rights reserved.
//
public var flipCount = 0

import Foundation

class Concentration {
    private(set) var cards = [Card]()
    var count = 0
    
    //var theScore = 0
    private var indexOfOneAndOnlyFaceUpCard: Int?{
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    // if we found our first card, remember it
                    if foundIndex == nil {
                        foundIndex = index
                        
                    } else {
                        // If there are two, return nil.  There is no such thing
                        return nil
                    }
                }
                
            }
            //this will return the first faceup card or no faceup car (i.e. nil) - remember optionals get a free init to nil
            return foundIndex
        }
        set {
            for index in cards.indices {
                // the expression (index == newalue will be false unless they match
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    func resetGame(){
        cards.removeAll()
    }
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCardat: \(index)): chosen index not in the cards")
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                
                // check if the cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 1
                    print(score)
                }
                if cards[matchIndex].identifier != cards[index].identifier{
                    score -= 1
                    print(score)
                }
                cards[index].isFaceUp = true
                
            } else {
                //either no cards or 2 are face up
                indexOfOneAndOnlyFaceUpCard = index
                /*
                for flipDownIndex in cards.indices {
                    
                    
                       
                    cards[flipDownIndex].isFaceUp = false
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
               */
            }
        }
        
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): you must have at least one pair of cards")
        var storeCard = [Card]()
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            storeCard += [card, card]
        }
        // shuffle the cards let n = Int(arc4random_uniform(42))

        for _ in storeCard{
            //let randIndex = Int.random(in:0 ... storeCard.count)
            
            let randIndex = Int(arc4random_uniform(UInt32(storeCard.count)))
            let newOrder = storeCard.remove(at: randIndex)
            cards.append(newOrder)
            
        }
        
    }
    //TODO: shuffle cards
}
