//
//  OnBoardingPage.swift
//  3Brata
//
//  Created by Вячеслав Квашнин on 14.05.2022.
//

import SwiftUI

struct OnBoardingPage: View {
    var body: some View {
        VStack {
            Spacer()
            
            Image("3brata_image")
                .resizable()
                .frame(width: 400, height: 400)
            
            Spacer()
            
            Button {
                
            } label: {
                Text("Get Started")
                    .font(.largeTitle)
                    .padding(.vertical, 15)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 30)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

struct OnBoardingPage_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPage()
    }
}
