//
//  LoginPageModel.swift
//  3Brata
//
//  Created by Вячеслав Квашнин on 14.05.2022.
//

import SwiftUI

class LoginPageModel: ObservableObject {
  
    @Published var email = ""
    @Published var password = ""
    
    @Published var registerUser = false
    @Published var reEnterPassword = ""
    @Published var showReEnterPassword = false
    
    func login() {
        
    }
    
    func register() {
        
    }
    
    func forgotPassword() {
        
    }
}
