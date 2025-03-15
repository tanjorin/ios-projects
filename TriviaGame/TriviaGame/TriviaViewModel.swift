//
//  TriviaViewModel.swift
//  TriviaGame
//
//  Created by Temi on 3/9/25.
//

import SwiftUI

class TriviaViewModel: ObservableObject {
    @Published var questions: [TriviaQuestion] = []
    @Published var userAnswers: [UUID: String] = [:]
    @Published var score: Int = 0
    @Published var gameCompleted: Bool = false

    func startGame(numberOfQuestions: Int, category: Int?, difficulty: String, type: String) async {
        do {
            let fetchedQuestions = try await TriviaService.shared.fetchTrivia(
                numberOfQuestions: numberOfQuestions,
                category: category,
                difficulty: difficulty,
                type: type
            )
            DispatchQueue.main.async {
                self.questions = fetchedQuestions
                self.userAnswers = [:]
                self.score = 0
                self.gameCompleted = false
            }
        } catch {
            print("Failed to fetch trivia: \(error.localizedDescription)")
        }
    }

    func selectAnswer(for question: TriviaQuestion, answer: String) {
        userAnswers[question.id] = answer
    }

    func calculateScore() {
        score = questions.filter { question in
            userAnswers[question.id] == question.correctAnswer
        }.count
        gameCompleted = true
    }
}
