//
//  CardView.swift
//  3Brata
//
//  Created by Вячеслав Квашнин on 17.05.2022.
//

import SwiftUI

struct CartView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Ваша корзина пуста")
                    .font(.largeTitle).bold()
                Button {
                    
                } label: {
                    Text("Перейти в меню")
                        .nextButtonStyle(isEnabledButton: false)
                }
                .padding()
            }
            .navigationTitle("Корзина")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
