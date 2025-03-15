//
//  ContentView.swift
//  MemoryGame
//
//  Created by Temi on 3/9/25.
//

import SwiftUI

struct MemoryGameView: View {
    @ObservedObject var viewModel = MemoryGameViewModel()
    
    let columns = [GridItem(.adaptive(minimum: 80))]

    var body: some View {
        VStack {
            Picker("Number of Pairs", selection: $viewModel.numberOfPairs) {
                ForEach(2...viewModel.emojis.count / 2, id: \.self) { num in
                    Text("\(num) Pairs")
                }
            }
            .pickerStyle(.segmented)
            .padding()

            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.cards.indices, id: \.self) { index in
                        CardView(card: viewModel.cards[index])
                            .onTapGesture {
                                viewModel.flipCard(index)
                            }
                    }
                }
                .padding()
            }

            Button("New Game") {
                viewModel.startNewGame()
            }
            .padding()
            .buttonStyle(.borderedProminent)
        }
    }
}

struct MemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView()
    }
}
