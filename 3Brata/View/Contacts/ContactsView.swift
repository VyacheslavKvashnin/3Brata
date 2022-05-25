//
//  Contacts.swift
//  3Brata
//
//  Created by Вячеслав Квашнин on 17.05.2022.
//

import SwiftUI
import MapKit

struct MyAnnotationItem: Identifiable {
    let coordinate: CLLocationCoordinate2D
    let id = UUID()
}

struct ContactsView: View {
    @State var coordinateRegion: MKCoordinateRegion = {
        var newRegion = MKCoordinateRegion()
        newRegion.center.latitude = 55.178521
        newRegion.center.longitude = 61.359672
        newRegion.span.latitudeDelta = 0.2
        newRegion.span.longitudeDelta = 0.2
        return newRegion
    }()
    
    let annotationItems: [MyAnnotationItem] = [
        MyAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 55.239284, longitude: 61.418294)),
        MyAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 55.163552, longitude: 61.434496)),
        MyAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 55.178521, longitude: 61.359672))
    ]
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Map(coordinateRegion: $coordinateRegion,
                        annotationItems: annotationItems) {item in
                        MapPin(coordinate: item.coordinate)
                    }
                }
                .frame(height: UIScreen.main.bounds.height / 3)
                
                VStack {
                    Divider()
                    
                    Button {
                        
                    } label: {
                        Text("Позвонить")
                            .nextButtonStyle(isEnabledButton: false)
                    }
                    Divider()
                    
                    Image("vk")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                }
                .padding()
                .padding(.horizontal, 40)
                
                
                
                Spacer()
                
                .navigationTitle("Контакты")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct Contacts_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
