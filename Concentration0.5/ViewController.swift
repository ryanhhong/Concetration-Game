//
//  ViewController.swift
//  Concentration0.5
//
//  Created by Ryan Hong on 2/2/20.
//  Copyright © 2020 Ryan Hong. All rights reserved.
//
public var score = 0 
import UIKit

class ViewController: UIViewController {
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    var numberOfPairsOfCards: Int{
        return (cardButtons.count + 1 ) / 2
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        updateViewFromModel()
    }
    
    //TODO: Randomly Generated Theme
    // 5 different themes of Emojis.. Choose one randomly at the beginning of each game.
    var genEmojiTheme: [String]?
    var emojiTheme = [Int:String]()
    var backgroundTheme: UIColor?
    var cardTheme:UIColor?

    
    
    
    func setTheme(){
        let choices = [theme1, theme2, theme3, theme4, theme5]
        let randIndex = Int(arc4random_uniform(UInt32(choices.count)))
        view.backgroundColor = choices[randIndex].backgroundColor
        gameScoreLabel.textColor = choices[randIndex].cardColor
        flipCountLabel.textColor =  choices[randIndex].cardColor
        genEmojiTheme = choices[randIndex].theEmoji
        cardTheme = choices[randIndex].cardColor
        
    }
    @IBOutlet weak var gameScoreLabel: UILabel!
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    var emojiChoices = ["🙂","🚴‍♂️","☂","☀️","🦊","🏄‍♀‍","💀","🤠","🏃‍♀‍","😛","🤪","🤕","🤑"]
    var emoji = [Int:String]()
    func emoji(for card: Card) -> String{
        
        if emoji[card.identifier] == nil, genEmojiTheme!.count > 0
        {
            let randomIndex =
                Int(arc4random_uniform(UInt32(genEmojiTheme!.count)))
            emoji[card.identifier] = genEmojiTheme!.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    
    @IBAction func newGameButton(_ sender: UIButton) {
        game.resetGame()
        game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
        emoji.removeAll()
        setTheme()
        updateViewFromModel()
        score = 0
        flipCount = 0
        gameScoreLabel.text = "Score: \(score)"
        flipCountLabel.text = "Flips: \(flipCount)"
        
    }
    @IBAction func touchCard(_ sender: UIButton) {
        //print ("smiley face")
        
        flipCount += 1
        flipCountLabel.text = "Flips: \(flipCount)"
        if let cardNumber = cardButtons.firstIndex(of: sender){
            //print("cardNumber = \(cardNumber)")
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            //flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }else{
            print("Chosen Card was not in cardButton")
        }
        
        //flipCountLabel.text = "Flips: \(flipCount)"
        //flipCard(withEmoji: "🙂", on: sender)
        //update the score. I put it here so it updates the label after the "math" has been computed
        gameScoreLabel.text = "Score: \(score)"
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = cardTheme; // replace color literal with theme color
            } else{
                button.setTitle("", for: UIControl.State.normal)
                //checks through all the buttons and if they are set to matched. then set invisible OR  blue
                button.backgroundColor = card.isMatched ?  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) :  cardTheme; // replace color literal with theme color
                
            }
        }
        func flipCard(withEmoji emoji: String, on button: UIButton){
            if button.currentTitle ==  emoji {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = cardTheme; // replace color literal with theme color
            }else{
                button.setTitle(emoji, for: UIControl.State.normal)
                button.backgroundColor = cardTheme; // replace color literal with theme color
            }
        }
        
    }
    
    
}
