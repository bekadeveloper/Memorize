//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Begzod on 25/04/21.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: randomNumber, cardContentFactory: cardContentFactory)
    }
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    
    // MARK: - Intents
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}


var emojis = ["👻", "🎃", "⚰️", "🕷", "🧟‍♀️"].shuffled()
var randomNumber = Int.random(in: 2...5)

func cardContentFactory(index: Int) -> String {
    return emojis[index]
}
