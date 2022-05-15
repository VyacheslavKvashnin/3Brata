//
//  OnBoardingPage.swift
//  3Brata
//
//  Created by Вячеслав Квашнин on 14.05.2022.
//

import SwiftUI

struct OnBoardingPage: View {
    @State private var showLoginPage = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            VStack(alignment: .leading) {
                Text("3 Brata")
                    .font(.system(size: 55))
                    .foregroundColor(.white)
                    .bold()
                
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .padding()
            }
            .padding()
            
            Spacer()
            
            Button {
                withAnimation {
                    showLoginPage = true
                }
            } label: {
                Text("Get Started")
                    .font(.body)
                    .padding(.vertical, 15)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 30)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.purple)
        .overlay(
            Group {
                if showLoginPage {
                    LoginPage()
                        .transition(.move(edge: .bottom))
                }
            }
        )
    }
}

struct OnBoardingPage_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPage()
    }
}

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
