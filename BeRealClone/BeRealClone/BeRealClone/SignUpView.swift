//
//  SignUpView.swift
//  BeRealClone
//
//  Created by Temi on 3/8/25.
//

import SwiftUI
import ParseSwift

struct SignUpView: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Sign Up") {
                signUp()
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .navigationTitle("Sign Up")
    }

    func signUp() {
        var newUser = User()
        newUser.username = username
        newUser.email = email
        newUser.password = password

        newUser.signup { result in
            switch result {
            case .success:
                presentationMode.wrappedValue.dismiss()
            case .failure(let error):
                print("❌ Sign up error: \(error.localizedDescription)")
            }
        }
    }
}
