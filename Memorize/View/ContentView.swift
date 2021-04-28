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
            if !card.isMatched || card.isFaceUp {
                ZStack {
                    Pie(startAngle: Angle.degrees(-90), endAngle: Angle.degrees(0))
                        .padding(6)
                        .opacity(pieOpacity)
                    Text(card.content)
                        .font(.system(size: min(geometry.size.width, geometry.size.height) * fontScaleFactor))
                }
                .cardify(isFaceUp: card.isFaceUp)
                .foregroundColor(.orange)
            }
        }
    }
    
    
    private let fontScaleFactor: CGFloat = 0.6
    private let pieOpacity = 0.4
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
            .preferredColorScheme(.dark)
    }
}
