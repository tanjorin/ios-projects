//
//  QuestionView.swift
//  TriviaGame
//
//  Created by Temi on 3/9/25.
//

import SwiftUI

struct QuestionView: View {
    let question: TriviaQuestion
    @ObservedObject var viewModel: TriviaViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(question.question)
                .font(.headline)
                .padding()

            ForEach(question.allAnswers, id: \.self) { answer in
                Button(action: {
                    viewModel.selectAnswer(for: question, answer: answer)
                }) {
                    Text(answer)
                        .padding()
                        .background(viewModel.userAnswers[question.id] == answer ? Color.blue.opacity(0.5) : Color.clear)
                        .cornerRadius(10)
                }
            }
        }
    }
}
