//
//  ContentView.swift
//  3Brata
//
//  Created by Вячеслав Квашнин on 14.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View {
        VStack {
            if status {
                MainView()
            } else {
                OnBoardingPage()
            }
        }
        .onAppear {
            NotificationCenter.default.addObserver(forName: Notification.Name("statusChange"), object: nil, queue: .main) { _ in
                status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
