//
//  MemoryGame.swift
//  Memorize
//
//  Created by Begzod on 25/04/21.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: [Card] = [Card]()
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    struct Card: Identifiable {
        var id = UUID()
        var content: CardContent
        var isFaceUp: Bool = true
        var isMatched: Bool = false
    }
    
    func choose(card: Card) {
        print("Card chosen: \(card)")
    }
}
