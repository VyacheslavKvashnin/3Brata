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
            TabView {
                Text("Menu")
                .tabItem {
                    Image(systemName: "sleep.circle")
                    Text("Menu")
                }

                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }

                ContactsView()
                    .tabItem {
                        Image(systemName: "phone")
                        Text("Contacts")
                    }

                CartView()
                    .tabItem {
                        Image(systemName: "cart")
                        Text("Cart")
                    }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
