//
//  GroupListView.swift
//  TheChatApp
//
//  Created by Arundas MK on 09/12/23.
//

import SwiftUI

struct GroupListView: View {
    
    let groups: [Group]
    
    var body: some View {
        List(groups) { group in
            NavigationLink {
                Text(group.subject)
            } label: {
                HStack {
                    Image(systemName: "person.2")
                    Text(group.subject)
                }
            }
        }
    }
}

#Preview {
    GroupListView(groups: [])
}
