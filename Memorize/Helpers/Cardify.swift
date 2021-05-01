//
//  Cardify.swift
//  Memorize
//
//  Created by Begzod on 28/04/21.
//

import SwiftUI


struct Cardify: AnimatableModifier {
    var isFaceUp: Bool {
        rotation < 90
    }
    
    var rotation: Double
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    var animatableData: Double {
        get { return rotation }
        set { rotation = newValue }
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: lineWidth)
                content
            }
                .opacity(isFaceUp ? 1 : 0)
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .opacity(isFaceUp ? 0 : 1)
        }
        .foregroundColor(.orange)
        .rotation3DEffect(.degrees(rotation), axis: (0,1,0))
    }
    
    private let cornerRadius: CGFloat = 10
    private let lineWidth: CGFloat = 3
}


extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
