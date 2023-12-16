//
//  String+Extensions.swift
//  TheChatApp
//
//  Created by Arundas MK on 05/12/23.
//

import Foundation

extension String {
    
    var isEmptyOrWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
