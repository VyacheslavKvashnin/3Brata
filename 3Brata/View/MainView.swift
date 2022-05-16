//
//  MainView.swift
//  3Brata
//
//  Created by Вячеслав Квашнин on 16.05.2022.
//

import SwiftUI
import Firebase

struct MainView: View {
    var body: some View {
        VStack {
            Text("Main")
            
            Button {
                try! Auth.auth().signOut()
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
            } label: {
                Text("LogOut")
            }

        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
