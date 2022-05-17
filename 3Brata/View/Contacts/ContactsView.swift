//
//  Contacts.swift
//  3Brata
//
//  Created by Вячеслав Квашнин on 17.05.2022.
//

import SwiftUI
import MapKit

struct MyAnnotationItem: Identifiable {
    var coordinate: CLLocationCoordinate2D
    let id = UUID()
}

struct ContactsView: View {
    @State var coordinateRegion: MKCoordinateRegion = {
        var newRegion = MKCoordinateRegion()
        newRegion.center.latitude = 55.239284
        newRegion.center.longitude = 61.418294
        newRegion.span.latitudeDelta = 0.2
        newRegion.span.longitudeDelta = 0.2
        return newRegion
    }()
    
    var annotationItems: [MyAnnotationItem] = [
        MyAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 55.239284, longitude: 61.418294)),
        MyAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 55.163552, longitude: 61.434496)),
        MyAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 55.178521, longitude: 61.359672))
    ]
    var body: some View {
        NavigationView {
            VStack {
                Map(coordinateRegion: $coordinateRegion,
                    annotationItems: annotationItems) {item in
                    MapPin(coordinate: item.coordinate)
                }
            }
            .navigationTitle("Контакты")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Contacts_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
