//
//  CustomTextField.swift
//  3Brata
//
//  Created by Вячеслав Квашнин on 15.05.2022.
//

import SwiftUI

func CustomTextField(
    icon: String,
    title: String,
    hint: String,
    value: Binding<String>,
    showPassword: Binding<Bool>
) -> some View {
    VStack(alignment: .leading, spacing: 12) {
        Label {
            Text(title)
                .font(.system(size: 14))
        } icon: {
            Image(systemName: icon)
        }
        .foregroundColor(Color.black.opacity(0.8))
        
        if title.contains("Password") && !showPassword.wrappedValue {
            SecureField(hint, text: value)
        }
        else {
            TextField(hint, text: value)
        }
        
        Divider()
    }
    .overlay(
        Group {
            if title.contains("Password") {
                Button(action: {
                    showPassword.wrappedValue.toggle()
                }, label: {
                    Text(showPassword.wrappedValue ? "Hide" : "Show")
                        .font(.system(size: 13)).bold()
                        .foregroundColor(.purple)
                })
                    .offset(y: 8)
            }
        }
        ,alignment: .trailing
    )
}

