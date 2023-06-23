//
//  CLGeocoder.swift
//  MPChallenge
//
//  Created by Marcelo De Araújo on 20/06/23.
//

import CoreLocation
import SwiftUI
import MapKit


class CLGeocoderManager: NSObject, ObservableObject, CLLocationManagerDelegate {

    @Published var currentCity: String = ""

    private let locationManager = CLLocationManager()

    override init() {
        super.init()
        locationManager.delegate = self
    }

    func startUpdatingLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(location) { placemarks, error in
                guard let placemark = placemarks?.first else {
                    return
                }
                guard let city = placemark.locality else {
                    return
                }
                guard let state = placemark.administrativeArea else {
                    return
                }
                DispatchQueue.main.async {
                    self.currentCity = "\(city), \(state)"
                }
            }
        }
    }
}
