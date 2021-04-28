//
//  ContentView.swift
//  Memorize
//
//  Created by Begzod on 25/04/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: EmojiMemoryGame
    var gridItems = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        LazyVGrid(columns: gridItems) {
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                    .aspectRatio(1, contentMode: .fit)
                    .onTapGesture {
                        viewModel.choose(card: card)
                    }
            }
        }
        .padding()
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: lineWidth)
                    Text(card.content)
                } else {
                    if !card.isMatched {
                        RoundedRectangle(cornerRadius: cornerRadius)
                    }
                }
            }
            .font(.system(size: min(geometry.size.width, geometry.size.height) * fontScaleFactor))
            .foregroundColor(.orange)
            .animation(.linear)
        }
    }
    
    
    // MARK: - Drawing Constants

    private let cornerRadius: CGFloat = 10
    private let lineWidth: CGFloat = 3
    private let fontScaleFactor: CGFloat = 0.75
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
            .preferredColorScheme(.dark)
    }
}
