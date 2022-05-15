//
//  OnBoardingPage.swift
//  3Brata
//
//  Created by Вячеслав Квашнин on 14.05.2022.
//

import SwiftUI

struct OnBoardingPage: View {
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
//            Image("3brata_image")
//                .resizable()
//                .frame(width: 400, height: 400)
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
