//
//  MemoryGameViewModel.swift
//  MemoryGame
//
//  Created by Temi on 3/9/25.
//

import SwiftUI

class MemoryGameViewModel: ObservableObject {
    @Published var cards: [Card] = []
    @Published var firstSelectedIndex: Int? = nil
    @Published var numberOfPairs = 4 // Default number of pairs

    let emojis = ["🍎", "🍊", "🍇", "🍌", "🍉", "🍓", "🍒", "🥝"]

    init() {
        startNewGame()
    }

    func startNewGame() {
        let selectedEmojis = emojis.prefix(numberOfPairs)
        let shuffledEmojis = (selectedEmojis + selectedEmojis).shuffled()
        cards = shuffledEmojis.map { Card(emoji: $0) }
        firstSelectedIndex = nil
    }

    func flipCard(_ index: Int) {
        guard !cards[index].isMatched else { return }

        if let firstIndex = firstSelectedIndex, firstIndex != index {
            if cards[firstIndex].emoji == cards[index].emoji {
                cards[firstIndex].isMatched = true
                cards[index].isMatched = true
            } else {
                withAnimation {
                    cards[firstIndex].isFaceUp = false
                }
            }
            firstSelectedIndex = nil
        } else {
            firstSelectedIndex = index
        }

        withAnimation {
            cards[index].isFaceUp.toggle()
        }
    }
}
