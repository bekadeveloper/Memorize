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
        let emojis = ["👻", "🎃", "⚰️", "🕷", "🧟‍♀️"].shuffled()

        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)) { index in
            return emojis[index]
        }
    }
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    
    // MARK: - Intents
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func resetGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
