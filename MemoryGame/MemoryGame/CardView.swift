//
//  CardView.swift
//  MemoryGame
//
//  Created by Temi on 3/9/25.
//

import SwiftUI

struct CardView: View {
    let card: Card

    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(radius: 5)
                Text(card.emoji)
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue.gradient)
                    .shadow(radius: 5)
            }
        }
        .frame(width: 80, height: 100)
        .animation(.default, value: card.isFaceUp)
    }
}

