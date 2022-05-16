//
//  VerifyCode.swift
//  3Brata
//
//  Created by Вячеслав Квашнин on 15.05.2022.
//

import SwiftUI
import Firebase

struct VerifyCode: View {
    @StateObject var loginData = LoginPageModel()
    @Binding var showVerify: Bool
    @Binding var id: String
    
    @State private var code = ""
    @State private var messageError = ""
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Enter Code")
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
                        title: "Enter code",
                        hint: "Enter code",
                        value: $loginData.email)
                        .padding(.top, 30)
                    
                    Button {
                        let credential = PhoneAuthProvider.provider().credential(withVerificationID: id, verificationCode: code)
                        
                        Auth.auth().signIn(with: credential) { response, error in
                            if error != nil {
                                messageError = error!.localizedDescription
                                showAlert.toggle()
                                return
                            }
                            UserDefaults.standard.set(true, forKey: "status")
                            NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
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

struct VerifyCode_Previews: PreviewProvider {
    static var previews: some View {
        VerifyCode(showVerify: .constant(.random()), id: .constant(""))
    }
}