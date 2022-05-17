//
//  VerifyCode.swift
//  3Brata
//
//  Created by Вячеслав Квашнин on 15.05.2022.
//

import SwiftUI

struct VerifyCode: View {
    @ObservedObject var loginViewModel: LoginViewModel
    
    var body: some View {
        VStack {
            Text("Enter Code")
                .titleStyle()
            
            VStack(spacing: 15) {
                CustomTextField(
                    icon: "barcode",
                    title: "Enter code",
                    hint: "Enter code",
                    value: $loginViewModel.code
                )
                    .padding(.top, 30)
                
                Spacer()
                
                Button {
                    loginViewModel.isEnabledButton = true
                    loginViewModel.loginWithCode()
                } label: {
                    Text("Next")
                        .nextButtonStyle(isEnabledButton: loginViewModel.isEnabledButton)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
            .alert("Error", isPresented: $loginViewModel.showAlert) {
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
        VerifyCode(loginViewModel: LoginViewModel())
    }
}
