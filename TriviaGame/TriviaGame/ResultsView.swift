//
//  ResultsView.swift
//  TriviaGame
//
//  Created by Temi on 3/9/25.
//

import SwiftUI

struct ResultsView: View {
    let score: Int
    let total: Int

    var body: some View {
        VStack {
            Text("Quiz Completed!")
                .font(.largeTitle)
                .padding()

            Text("Your Score: \(score) / \(total)")
                .font(.title)
                .padding()

            Button("Play Again") {
                // Add navigation logic to restart the game
            }
            .padding()
            .buttonStyle(.borderedProminent)
        }
    }
}


struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(score: 3, total: 5)
    }
}
