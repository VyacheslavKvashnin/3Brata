//
//  ProfileView.swift
//  3Brata
//
//  Created by Вячеслав Квашнин on 17.05.2022.
//

import SwiftUI
import Firebase

struct ProfileView: View {
    var body: some View {
        NavigationView {
            Text("Profile")
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

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
