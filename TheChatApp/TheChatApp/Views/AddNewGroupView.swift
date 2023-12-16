//
//  AddNewGroupView.swift
//  TheChatApp
//
//  Created by Arundas MK on 05/12/23.
//

import SwiftUI

struct AddNewGroupView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var model: Model
    @State private var groupSubject: String = ""
    
    private var isFormValid: Bool {
        !groupSubject.isEmptyOrWhiteSpace
    }
    
    private func saveGroup() {
        let group = Group(subject: groupSubject)
        model.saveGroup(group: group) { error in
            if let error {
                print(error.localizedDescription)
            }
            dismiss()
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("Group Subject", text: $groupSubject)
                }
                Spacer()
            }.padding()
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("New Group")
                            .bold()

                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            dismiss()
                        }

                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Create") {
                            saveGroup()
                        }.disabled(!isFormValid)

                    }
                }
        }
    }
}

#Preview {
    NavigationStack {
        AddNewGroupView()
            .environmentObject(Model())
    }
}
