//
//  VerifyCode.swift
//  3Brata
//
//  Created by Вячеслав Квашнин on 15.05.2022.
//

import SwiftUI
import Firebase

struct VerifyCode: View {
    @StateObject var loginViewModel = LoginViewModel()
    @Binding var ID: String
    
    @State private var code = ""
    @State private var messageError = ""
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Enter Code")
                .titleStyle()
            
            VStack(spacing: 15) {
                CustomTextField(
                    icon: "barcode",
                    title: "Enter code",
                    hint: "Enter code",
                    value: $code
                )
                    .padding(.top, 30)
                
                Spacer()
                
                Button {
                    loginViewModel.isEnabledButton = true
                    let credential = PhoneAuthProvider.provider().credential(withVerificationID: ID, verificationCode: code)

                    Auth.auth().signIn(with: credential) { response, error in
                        if error != nil {
                            messageError = error!.localizedDescription
                            showAlert.toggle()
                            return
                        }
                        UserDefaults.standard.set(true, forKey: "status")
                        NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                    }
//                    loginViewModel.loginWithCode()
                } label: {
                    Text("Next")
                        .nextButtonStyle(isEnabledButton: loginViewModel.isEnabledButton)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
            .alert("Error", isPresented: $showAlert) {
                Button {
                    loginViewModel.isEnabledButton.toggle()
                } label: {
                    Text("OK")
                }
            }
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

struct VerifyCode_Previews: PreviewProvider {
    static var previews: some View {
        VerifyCode(ID: .constant(""))
    }
}
