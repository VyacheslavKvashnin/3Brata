//
//  NextButtonStyle.swift
//  3Brata
//
//  Created by Вячеслав Квашнин on 16.05.2022.
//

import SwiftUI

struct NextButtonStyle: ViewModifier {
    let isEnabledButton: Bool
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20).weight(.bold))
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity)
            .foregroundColor(isEnabledButton ? .purple : .white)
            .background(.purple)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 5, y: 5)
            .overlay(
                isEnabledButton
                ? ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                : nil
            )
    }
}

extension View {
    func nextButtonStyle(isEnabledButton: Bool) -> some View {
        modifier(NextButtonStyle(isEnabledButton: isEnabledButton))
    }
}
