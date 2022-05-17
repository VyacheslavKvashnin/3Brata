//
//  ProfileView.swift
//  3Brata
//
//  Created by Вячеслав Квашнин on 17.05.2022.
//

import SwiftUI
import Firebase

struct ProfileView: View {
    @State private var userName = ""
    @State private var phoneNumber = ""
    @State private var email = ""
    @State private var birthday = ""
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    Divider()
                    
                    CustomTextFieldProfile(userName: "Name", placeholder: "Enter name", value: $userName)
                    CustomTextFieldProfile(userName: "Phone number", placeholder: "Enter phone number", value: $phoneNumber)
                    CustomTextFieldProfile(userName: "Email", placeholder: "Enter email", value: $email)
                    CustomTextFieldProfile(userName: "Birthday", placeholder: "birthday", value: $birthday)
                    
                    Spacer()
                }
                .padding()
                .navigationTitle("Profile")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            try! Auth.auth().signOut()
                            UserDefaults.standard.set(false, forKey: "status")
                            NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                        } label: {
                            Image(systemName: "rectangle.lefthalf.inset.filled.arrow.left")
                        }
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
