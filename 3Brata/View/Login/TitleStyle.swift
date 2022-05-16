//
//  ModifierTitleLogin.swift
//  3Brata
//
//  Created by Вячеслав Квашнин on 16.05.2022.
//

import SwiftUI

struct TitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 55).weight(.bold))
            .foregroundColor(Color.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: UIScreen.main.bounds.height / 3.5)
            .padding()
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(TitleStyle())
    }
}
