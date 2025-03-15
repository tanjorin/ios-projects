//
//  FeedView.swift
//  BeRealClone
//
//  Created by Temi on 3/8/25.
//

import SwiftUI
import ParseSwift

struct FeedView: View {
    @State private var posts: [Post] = []

    var body: some View {
        NavigationView {
            List(posts, id: \.objectId) { post in
                VStack {
                    if let imageUrl = post.imageFile?.url {
                        AsyncImage(url: imageUrl) { image in
                            image.resizable().scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                    }

                    Text(post.caption ?? "No Caption")
                        .font(.headline)
                }
                .padding()
            }
            .navigationTitle("Feed")
            .onAppear {
                fetchPosts()
            }
        }
    }

    func fetchPosts() {
        let query = Post.query()
            .include("user")
            .order([.descending("createdAt")])

        query.find { result in
            switch result {
            case .success(let posts):
                DispatchQueue.main.async {
                    self.posts = posts
                }
            case .failure(let error):
                print("❌ Fetch error: \(error.localizedDescription)")
            }
        }
    }
}
