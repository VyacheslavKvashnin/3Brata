//
//  LoginPage.swift
//  3Brata
//
//  Created by Вячеслав Квашнин on 14.05.2022.
//

import SwiftUI
import Firebase

struct LoginPage: View {
    @StateObject var loginData = LoginPageModel()
    var body: some View {
        VStack {
            Text("Enter Your\nPhone Number")
                .font(.system(size: 55))
                .foregroundColor(.white)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: getRect().height / 3.5)
                .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    CustomTextField(
                        icon: "phone",
                        title: "Enter phone number",
                        hint: "+7900123456",
                        value: $loginData.email,
                        showPassword: $loginData.showPassword)
                        .padding(.top, 30)
                    
                    Button {
                        if loginData.registerUser {
                            loginData.register()
                        } else {
                            loginData.login()
                        }
                    } label: {
                        Text("Next")
                            .font(.system(size: 17)).bold()
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(.purple)
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 5, y: 5)
                    }
                    .padding(.top, 20)
                    .padding(.horizontal)
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.white
                    .clipShape(CustomCorners(corners: [.topLeft, .topRight], radius: 25))
                    .ignoresSafeArea()
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.purple)
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
