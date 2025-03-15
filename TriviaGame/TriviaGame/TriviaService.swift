//
//  TriviaService.swift
//  TriviaGame
//
//  Created by Temi on 3/9/25.
//

import Foundation

class TriviaService {
    static let shared = TriviaService()

    func fetchTrivia(numberOfQuestions: Int, category: Int?, difficulty: String, type: String) async throws -> [TriviaQuestion] {
        var urlString = "https://opentdb.com/api.php?amount=\(numberOfQuestions)&difficulty=\(difficulty)&type=\(type)"
        
        if let category = category {
            urlString += "&category=\(category)"
        }

        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(TriviaResponse.self, from: data)
        
        return response.results
    }
}
