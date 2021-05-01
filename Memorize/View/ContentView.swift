//
//  ContentView.swift
//  Memorize
//
//  Created by Begzod on 25/04/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Grid(viewModel.cards) { card in
                CardView(card: card)
                    .onTapGesture {
                        withAnimation(.linear) {
                            viewModel.choose(card: card)
                        }
                    }
            }

            Button(action:
                withAnimation(.easeInOut) { // TODO: Animation is not working(
                    viewModel.resetGame
                }
            ) {
                Text("New Game")
                    .bold()
                    .padding(10)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
        }
        .padding()
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    
    @State private var animatedBonusRemaining: Double = 0
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaining = 0
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            if !card.isMatched || card.isFaceUp {
                ZStack {
                    Group {
                        if card.isConsumingBonusTime {
                            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-animatedBonusRemaining*360-90))
                                .onAppear {
                                    startBonusTimeAnimation()
                                }
                        } else {
                            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-animatedBonusRemaining*360-90))
                        }
                    }
                    .padding(6)
                    .opacity(pieOpacity)
                    
                    Text(card.content)
                        .font(.system(size: min(geometry.size.width, geometry.size.height) * fontScaleFactor))
                        .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                        .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
                }
                .cardify(isFaceUp: card.isFaceUp)
                .transition(.scale)
            }
        }
        .padding(5)
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
