//
//  MemoryGame.swift
//  Memorize
//
//  Created by Begzod on 25/04/21.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
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
        var isFaceUp: Bool = false
        var isMatched: Bool = false
    }
    
    
    var indexOfOneAndOnlyCard: Int?
    
    mutating func choose(card: Card) {
        guard let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) else { return }
        
        if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {

            if indexOfOneAndOnlyCard == nil {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfOneAndOnlyCard = chosenIndex
                
            } else {
                if cards[indexOfOneAndOnlyCard!].content == cards[chosenIndex].content {
                    cards[indexOfOneAndOnlyCard!].isMatched = true
                    cards[chosenIndex].isMatched = true
                }
                indexOfOneAndOnlyCard = nil
            }
            
            cards[chosenIndex].isFaceUp.toggle()
        }
        
        
        
        print("Card chosen: \(cards[chosenIndex])")
    }
}
