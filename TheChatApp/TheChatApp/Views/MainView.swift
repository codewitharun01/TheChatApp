//
//  MainView.swift
//  TheChatApp
//
//  Created by Arundas MK on 05/12/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            GroupListContainerView()
                .tabItem {
                    Label("Chats", systemImage: "message.fill")
                }
            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    MainView()
}
