//
//  BeRealCloneApp.swift
//  BeRealClone
//
//  Created by Temi on 3/6/25.
//

import SwiftUI
import ParseSwift

@main
struct BeRealCloneApp: App {
    init() {
        // Initialize Parse
        ParseSwift.initialize(
            applicationId: "aq8o6mzVohUJanLKOH0whuw66BTZ7SFOKT1VhuUq",
            clientKey: "M5v39XstsmDEx79PjrpeuZLzZsMLFZTNw28mwwFH",
            serverURL: URL(string: "https://parseapi.back4app.com")!
        )

        // ✅ Check if user is logged in
        if let currentUser = User.current {
            print("✅ User is already logged in: \(currentUser.username ?? "Unknown")")
        } else {
            print("🔹 No user logged in.")
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
