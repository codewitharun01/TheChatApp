//
//  LoginView.swift
//  TheChatApp
//
//  Created by Arundas MK on 05/12/23.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject private var appState: AppState
    
    private var isFormValid: Bool {
        !email.isEmptyOrWhiteSpace && !password.isEmptyOrWhiteSpace
    }
    
    private func login() async{
        do {
            let _ = try await Auth.auth().signIn(withEmail: email, password: password)
            appState.routes.append(.main)
        } catch {
            
        }
        
    }
    
    var body: some View {
        Form {
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            HStack {
                Spacer()
                Button("Login") {
                    Task {
                        await login()
                    }
                }.disabled(!isFormValid)
                    .buttonStyle(.borderless)
                
                Button("SignUp") {
                    appState.routes.append(.signUp)
                }.buttonStyle(.borderless)
                Spacer()
            }
            //Text(errorMessage)
        }
    }
}

#Preview {
    LoginView().environmentObject(AppState())
}
