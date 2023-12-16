//
//  TheChatAppApp.swift
//  TheChatApp
//
//  Created by Arundas MK on 05/12/23.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct TheChatAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var appState = AppState()
    @StateObject private var model = Model()
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $appState.routes) {
                ZStack {
                    if Auth.auth().currentUser != nil {
                        MainView()
                    } else { LoginView()}
                }.navigationDestination(for: Route.self) { route in
                    switch route {
                    case .main:
                        MainView()
                    case .login:
                        LoginView()
                    case .signUp:
                        SignUpView()
                    }
                }
            }
            .environmentObject(appState)
            .environmentObject(model)
            
        }
    }
}
