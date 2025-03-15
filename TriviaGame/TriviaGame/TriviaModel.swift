//
//  TriviaModel.swift
//  TriviaGame
//
//  Created by Temi on 3/9/25.
//

import Foundation

struct TriviaResponse: Codable {
    let results: [TriviaQuestion]
}

struct TriviaQuestion: Codable, Identifiable {
    let id = UUID()
    let category: String
    let type: String
    let difficulty: String
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]

    var allAnswers: [String] {
        (incorrectAnswers + [correctAnswer]).shuffled()
    }
}
