//
//  CustomTextFieldProfile.swift
//  3Brata
//
//  Created by Вячеслав Квашнин on 17.05.2022.
//

import SwiftUI

func CustomTextFieldProfile(userName: String, placeholder: String, value: Binding<String>) -> some View {
    VStack(alignment: .leading, spacing: 12) {
      
            Text(userName)
                .font(.system(size: 14))
       
        .foregroundColor(Color.black.opacity(0.8))
        
        TextField(placeholder, text: value)
        
        Divider()
    }
}
