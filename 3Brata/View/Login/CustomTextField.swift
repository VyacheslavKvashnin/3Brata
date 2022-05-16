//
//  CustomTextField.swift
//  3Brata
//
//  Created by Вячеслав Квашнин on 15.05.2022.
//

import SwiftUI

func CustomTextField(icon: String, title: String, hint: String, value: Binding<String>) -> some View {
    VStack(alignment: .leading, spacing: 12) {
        Label {
            Text(title)
                .font(.system(size: 14))
        } icon: {
            Image(systemName: icon)
        }
        .foregroundColor(Color.black.opacity(0.8))
        
        TextField(hint, text: value)
        
        Divider()
    }
}

