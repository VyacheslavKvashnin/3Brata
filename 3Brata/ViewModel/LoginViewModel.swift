//
//  LoginPageModel.swift
//  3Brata
//
//  Created by Вячеслав Квашнин on 14.05.2022.
//

import SwiftUI

struct User {
    let userName = ""
    let numberPhone = ""
    let email = ""
    let birthday: Date = Date()
}

class LoginViewModel: ObservableObject {
    @Published var numberPhone = ""
    @Published var isEnabledButton = false
    @Published var showAlert: Bool = false
}
