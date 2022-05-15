//
//  CustomButtonForLoginPage.swift
//  3Brata
//
//  Created by Вячеслав Квашнин on 15.05.2022.
//

import SwiftUI

struct CustomButtonForLoginPage: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(title, action: action)
    }
}
    
