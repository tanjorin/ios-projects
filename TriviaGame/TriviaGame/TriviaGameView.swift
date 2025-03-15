//
//  TriviaGameView.swift
//  TriviaGame
//
//  Created by Temi on 3/9/25.
//

import SwiftUI

struct TriviaGameView: View {
    @StateObject var viewModel = TriviaViewModel()
    let numberOfQuestions: Int
    let difficulty: String
    let type: String
    let category: Int?

    var body: some View {
        VStack {
            if viewModel.questions.isEmpty {
                ProgressView("Loading Questions...")
                    .task {
                        await viewModel.startGame(numberOfQuestions: numberOfQuestions, category: category, difficulty: difficulty, type: type)
                    }
            } else {
                List(viewModel.questions) { question in
                    QuestionView(question: question, viewModel: viewModel)
                }

                Button("Submit Answers") {
                    viewModel.calculateScore()
                }
                .padding()
                .buttonStyle(.borderedProminent)
                .navigationDestination(isPresented: $viewModel.gameCompleted) {
                    ResultsView(score: viewModel.score, total: viewModel.questions.count)
                }
            }
        }
    }
}
