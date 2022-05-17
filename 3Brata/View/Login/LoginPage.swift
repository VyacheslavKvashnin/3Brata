//
//  LoginPage.swift
//  3Brata
//
//  Created by Вячеслав Квашнин on 14.05.2022.
//

import SwiftUI
import Firebase

struct LoginPage: View {
    @StateObject var loginViewModel = LoginViewModel()
    @State private var showVerify = false
    
    @State private var messageError = ""
    @State private var showAlert = false
    @State private var ID = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Enter Your\nPhone Number")
                    .titleStyle()
                
                VStack(spacing: 15) {
                    CustomTextField(
                        icon: "phone",
                        title: "Phone number",
                        hint: "Enter phone number",
                        value: $loginViewModel.numberPhone
                    )
                        .padding(.top, 30)
                    
                    Spacer()
                    
                    NavigationLink(destination: VerifyCode(ID: $loginViewModel.ID), isActive: $loginViewModel.showVerify) {
                        Button {
                            loginViewModel.isEnabledButton = true
                            loginViewModel.verifyUser()
                        } label: {
                            Text("Next")
                                .nextButtonStyle(isEnabledButton: loginViewModel.isEnabledButton)
                        }
                        .padding(.horizontal)
                    }
                    .disabled(loginViewModel.isEnabledButton ? true : false)
                    .alert("Error", isPresented: $showAlert) {
                        Button {
                            loginViewModel.isEnabledButton.toggle()
                        } label: {
                            Text("OK")
                        }
                    }
                 
                    Spacer()
                }
                .padding()
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
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
