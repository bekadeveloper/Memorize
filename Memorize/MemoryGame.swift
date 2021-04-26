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
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var id = UUID()
        var content: CardContent
        var isFaceUp: Bool = true
        var isMatched: Bool = false
    }
    
    
    mutating func choose(card: Card) {
        
        guard let chosenIndex = index(of: card) else { return }
        cards[chosenIndex].isFaceUp.toggle()
//        print("Card chosen: \(cards[chosenIndex])")
    }
    
    
    func index(of card: Card) -> Int? {
        
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }
}
