//
//  SignUpView.swift
//  TheChatApp
//
//  Created by Arundas MK on 05/12/23.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var displayName: String = ""
    @State private var errorMessage: String = ""
    
    @EnvironmentObject private var model: Model
    @EnvironmentObject private var appState: AppState
    
    private var isFormValid: Bool {
        !email.isEmptyOrWhiteSpace && !password.isEmptyOrWhiteSpace && !displayName.isEmptyOrWhiteSpace
    }
    
    private func signUp() async{
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            try await model.updateDisplayName(for: result.user, displayName: displayName)
            appState.routes.append(.login)
        } catch {
            errorMessage = error.localizedDescription
        }
        
    }
    
    var body: some View {
        Form {
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            TextField("Display name", text: $displayName)
            
            HStack {
                Spacer()
                Button("SignUp") {
                    Task {
                        await signUp()
                    }
                }.disabled(!isFormValid)
                    .buttonStyle(.borderless)
                Button("Login") {
                    appState.routes.append(.login)
                }
                Spacer()
            }
            Text(errorMessage)
        }
        
    }
}

#Preview {
    SignUpView().environmentObject(Model()).environmentObject(AppState())
}

