//
//  IGTextFieldModifier.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/21.
//

import SwiftUI

struct IGTextFieldModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
