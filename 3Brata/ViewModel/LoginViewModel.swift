//
//  LoginPageModel.swift
//  3Brata
//
//  Created by Вячеслав Квашнин on 14.05.2022.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var numberPhone = ""
    @Published var isEnabledButton = false
    @Published var showAlert: Bool = false
}
