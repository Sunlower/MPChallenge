//
//  LocationDelegate.swift
//  NovoWatch Watch App
//
//  Created by Ieda Xavier on 22/06/23.
//

import SwiftUI
import CoreLocation
import MapKit

class LocationDelegate: NSObject, CLLocationManagerDelegate, ObservableObject {

    @Published var coordRegion = MKCoordinateRegion()

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)

        CLGeocoder().reverseGeocodeLocation(locations[0]) { places, _ in
            if let place = places?.first {
                print("name \(place.name) location \(place.location)")
            }
        }
    }

}
