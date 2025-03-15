//
//  Card.swift
//  MemoryGame
//
//  Created by Temi on 3/9/25.
//

import Foundation

struct Card: Identifiable, Equatable {
    let id = UUID()
    let emoji: String
    var isFaceUp: Bool = false
    var isMatched: Bool = false
}
