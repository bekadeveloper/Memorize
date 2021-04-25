//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Begzod on 25/04/21.
//

import SwiftUI



class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count, cardContentFactory: cardContentFactory)
    }
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    // MARK: Intents
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}


let emojis = ["👻","🎃","⚰️"]

func cardContentFactory(index: Int) -> String {
    return emojis[index]
}
