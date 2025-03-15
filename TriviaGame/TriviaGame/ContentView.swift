//
//  ContentView.swift
//  TriviaGame
//
//  Created by Temi on 3/9/25.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfQuestions = 5
    @State private var difficulty = "medium"
    @State private var questionType = "multiple"
    @State private var category: Int? = nil
    @State private var showGame = false

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Number of Questions")) {
                    Stepper("\(numberOfQuestions)", value: $numberOfQuestions, in: 5...20)
                }

                Section(header: Text("Difficulty")) {
                    Picker("Difficulty", selection: $difficulty) {
                        Text("Easy").tag("easy")
                        Text("Medium").tag("medium")
                        Text("Hard").tag("hard")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("Question Type")) {
                    Picker("Type", selection: $questionType) {
                        Text("Multiple Choice").tag("multiple")
                        Text("True/False").tag("boolean")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Button("Start Game") {
                    showGame = true
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .navigationTitle("Trivia Game")
            .navigationDestination(isPresented: $showGame) {
                TriviaGameView(numberOfQuestions: numberOfQuestions, difficulty: difficulty, type: questionType, category: category)
            }
        }
    }
}
