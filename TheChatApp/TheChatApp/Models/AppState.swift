//
//  AppState.swift
//  TheChatApp
//
//  Created by Arundas MK on 05/12/23.
//

import Foundation

enum Route: Hashable {
    case main
    case login
    case signUp
}

class AppState: ObservableObject {
    @Published var routes: [Route] = []
}
