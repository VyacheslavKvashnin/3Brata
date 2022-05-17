//
//  LoginPageModel.swift
//  3Brata
//
//  Created by Вячеслав Квашнин on 14.05.2022.
//

import SwiftUI
import Firebase

class LoginViewModel: ObservableObject {
    @Published var numberPhone = ""
    @Published var isEnabledButton = false
    @Published var showAlert = false
    
    @Published var messageError = ""
    @Published var ID = ""
    @Published var code = ""
    @Published var showVerify = false
    
    func verifyUser() {
        PhoneAuthProvider.provider().verifyPhoneNumber("+"+numberPhone, uiDelegate: nil) { (id, error) in
            if error != nil {
                self.messageError = error!.localizedDescription
                self.showAlert.toggle()
                return
            }
            self.ID = id ?? ""
            self.showVerify.toggle()
            self.isEnabledButton.toggle()
        }
    }
    
    func loginWithCode() {
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: ID, verificationCode: code)
        
        Auth.auth().signIn(with: credential) { response, error in
            if error != nil {
                self.messageError = error!.localizedDescription
                self.showAlert.toggle()
                return
            }
            UserDefaults.standard.set(true, forKey: "status")
            NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
        }
    }
}
