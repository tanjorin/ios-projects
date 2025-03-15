//
//  ContentView.swift
//  BeRealClone
//
//  Created by Temi on 3/6/25.
//

import SwiftUI
import ParseSwift

struct ContentView: View {
    @State private var isLoggedIn = User.current != nil
    @State private var showPhotoPicker = false
    @State private var refreshID = UUID()

    var body: some View {
        NavigationView {
            VStack {
                if isLoggedIn {
                    Text("Welcome, \(User.current?.username ?? "User")!")
                        .font(.title)
                        .padding()

                    NavigationLink("View Feed", destination: FeedView())
                        .buttonStyle(.borderedProminent)
                        .padding()

                    Button("Upload a Photo") {
                        showPhotoPicker = true
                    }
                    .buttonStyle(.bordered)
                    .padding()
                    .sheet(isPresented: $showPhotoPicker) {
                        PhotoPickerView()
                    }

                    Button("Logout") {
                        logout()
                    }
                    .buttonStyle(.bordered)
                    .padding()
                } else {
                    Text("Welcome to BeReal Clone")
                        .font(.title)
                        .padding()

                    NavigationLink("Sign Up", destination: SignUpView())
                        .padding()
                        .buttonStyle(.borderedProminent)

                    NavigationLink("Login", destination: LoginView())
                        .padding()
                        .buttonStyle(.bordered)
                }
            }
            .navigationTitle("BeReal Clone")
            .id(refreshID)
        }
    }

    func logout() {
        User.logout { result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    isLoggedIn = false
                    refreshID = UUID()
                }
            case .failure(let error):
                print("❌ Logout error: \(error.localizedDescription)")
            }
        }
    }
}

