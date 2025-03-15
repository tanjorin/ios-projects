//
//  LoginView.swift
//  BeRealClone
//
//  Created by Temi on 3/8/25.
//

import SwiftUI
import ParseSwift

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Login") {
                login()
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .navigationTitle("Login")
    }

    func login() {
        User.login(username: username, password: password) { result in
            switch result {
            case .success:
                presentationMode.wrappedValue.dismiss()
            case .failure(let error):
                print("❌ Login error: \(error.localizedDescription)")
            }
        }
    }
}
