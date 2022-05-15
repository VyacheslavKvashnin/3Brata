//
//  LoginPage.swift
//  3Brata
//
//  Created by Вячеслав Квашнин on 14.05.2022.
//

import SwiftUI

struct LoginPage: View {
    @StateObject var loginData = LoginPageModel()
    var body: some View {
        VStack {
            Text("Welcome\nback")
                .font(.system(size: 55))
                .foregroundColor(.white)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: getRect().height / 3.5)
                .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    Text(loginData.registerUser ? "Register" : "Login")
                        .font(.system(size: 22)).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    CustomTextField(
                        icon: "envelope",
                        title: "Email",
                        hint: "mail@mail.com",
                        value: $loginData.email,
                        showPassword: $loginData.showPassword)
                        .padding(.top, 30)
                    
                    CustomTextField(
                        icon: "lock",
                        title: "Password",
                        hint: "123456",
                        value: $loginData.password,
                        showPassword: $loginData.showPassword)
                        .padding(.top, 20)
                    
                    if loginData.registerUser {
                        CustomTextField(
                            icon: "lock",
                            title: "Re-Enter Password",
                            hint: "123456",
                            value: $loginData.reEnterPassword,
                            showPassword: $loginData.showReEnterPassword)
                            .padding(.top, 20)
                    }
                    
                    // Forgot Password Button...
                    Button {
                        loginData.forgotPassword()
                    } label: {
                        Text("Forgot password?")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.purple)
                    }
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button {
                        if loginData.registerUser {
                            loginData.register()
                        } else {
                            loginData.login()
                        }
                    } label: {
                        Text(loginData.registerUser ? "Register" : "Login")
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
                    
                    Button {
                        withAnimation {
                            loginData.registerUser.toggle()
                        }
                    } label: {
                        Text(loginData.registerUser ? "Back To Login" : "Create account")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.purple)
                    }
                    .padding(.top, 8)
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
        .onChange(of: loginData.registerUser) { newValue in
            loginData.email = ""
            loginData.password = ""
            loginData.reEnterPassword = ""
            loginData.showPassword = false
            loginData.showReEnterPassword = false
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
