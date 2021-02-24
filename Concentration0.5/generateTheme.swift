//
//  generateTheme.swift
//  Concentration0.5
//
//  Created by Ryan Hong on 2/18/20.
//  Copyright © 2020 Ryan Hong. All rights reserved.
//
// Add 1 line of code here per theme
let theme1 = generateTheme.init(theEmoji: ["😀","😄","😅","😂","🤣","☺️","😊","😇","🙃","😉","😍","🥰","😘"], backgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), cardColor: #colorLiteral(red: 1, green: 0.1223147288, blue: 0.9456997514, alpha: 0.8470588235))
let theme2 = generateTheme.init(theEmoji: ["👍","👍🏻","👎","👎🏻","👊","👊🏻","🤞","✌️","🤟","👌","👈","👉","👆"], backgroundColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), cardColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
let theme3 = generateTheme.init(theEmoji: ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐯","🦁","🐮","🐷"], backgroundColor: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1), cardColor: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1))
let theme4 = generateTheme.init(theEmoji: ["🐝","🐛","🦋","🐌","🐞","🐜","🦟","🦗","🕷","🕸","🐢","🐍","🦎"], backgroundColor: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), cardColor: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1))
let theme5 = generateTheme.init(theEmoji: ["🇺🇸","🏳️","🏴","🏴‍☠️","🏁","🚩","🏳️‍🌈","🇧🇧","🇰🇭","🇸🇽","🇷🇺","🇳🇬","🇰🇷"], backgroundColor: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), cardColor: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))

import UIKit
import Foundation
struct generateTheme{
    var theEmoji: [String]
    var backgroundColor: UIColor
    var cardColor: UIColor
}
