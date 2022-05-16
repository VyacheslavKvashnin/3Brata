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
    @State private var showVerify = false
    
    @State private var no = ""
    
    @State private var messageError = ""
    @State private var showAlert = false
    @State private var ID = ""
    
    @State private var isEnabledButton = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Enter Your\nPhone Number")
                    .titleStyle()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 15) {
                        
                        CustomTextField(icon: "phone", title: "Phone number", hint: "Enter phone number", value: $no)
                            .padding(.top, 30)
                        
                        NavigationLink(destination: VerifyCode(showVerify: $showVerify, ID: $ID), isActive: $showVerify) {
                            Button {
                                loginData.isEnabledButton = true
                                PhoneAuthProvider.provider().verifyPhoneNumber("+"+no, uiDelegate: nil) { (id, error) in
                                    if error != nil {
                                        messageError = error!.localizedDescription
                                        showAlert.toggle()
                                        return
                                    }
                                    self.ID = id ?? ""
                                    showVerify.toggle()
                                    loginData.isEnabledButton.toggle()
                                }
                            } label: {
                                Text("Next")
                                    .nextButtonStyle(isEnabledButton: loginData.isEnabledButton)
                            }
                            .padding(.top, 20)
                            .padding(.horizontal)
                            
                        }
                        .disabled(loginData.isEnabledButton ? true : false)
                        .alert("Error", isPresented: $showAlert) {
                            Button {
                                loginData.isEnabledButton.toggle()
                            } label: {
                                Text("OK")
                            }
                        }
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
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
