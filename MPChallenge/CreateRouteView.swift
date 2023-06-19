//
//  CreateRouteView.swift
//  MPChallenge
//
//  Created by Vinícius Cavalcante on 19/06/23.
//

import SwiftUI
import MapKit

struct CreateRouteView: View {
    @StateObject var locationDataManager = LocationDataManager()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.83834587046632,
                                       longitude: 14.254053016537693),
        span: MKCoordinateSpan(latitudeDelta: 0.05,
                               longitudeDelta: 0.05)
    )

    @State private var currentCity = "Carregando..."
    @State private var searchResults: [MKMapItem] = []

    var body: some View {
        if locationDataManager.authorizationStatus == .authorizedWhenInUse {
            VStack {
                ZStack {
                    Map(coordinateRegion: $region, showsUserLocation: true)
//                    {
//                        Annotation("Current Location", coordinate: region.center){
//                            ZStack{
//                                RoundedRectangle(cornerRadius: 5)
//                                    .fill(.background)
//                                RoundedRectangle(cornerRadius: 5)
//                                    .stroke(.secondary, lineWidth: 6)
//                                Image(systemName: "car")
//                                    .padding()
//                            }
//                        }
//                        .annotationTitles(.hidden)
//                        ForEach(searchResults, id: \.self){ result in
//                            Marker(item: result)
//                        }
//                    }
                        .mask(
                            RoundedRectangle(cornerRadius: 24)
                                .fill(Color.blue)
                                .padding()
                                .frame(height: 201)
                        )
                    .padding(.leading, 32)
                    .padding(.trailing, 32)
                }

                List(searchResults.sorted{$0.name ?? " " < $1.name ?? " "}, id: \.self) { result in
                    VStack{
                        Text(result.name ?? "")
                        Text(result.placemark.location?.distance(from: CLLocation(latitude: locationDataManager.latitude, longitude: locationDataManager.longitude)).description ?? "")
                    }
                }
                FilterButtons(searchResults: $searchResults)
            }
            .onAppear {
                region = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: locationDataManager.latitude,
                        longitude: locationDataManager.longitude),
                        span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
                )
//                let geocoder = CLGeocoder()
//                let location = CLLocation(latitude: region.center.latitude,
//                                          longitude: region.center.longitude)
//                geocoder.reverseGeocodeLocation(location, completionHandler: { placemarks, _ -> Void in
//
//                    guard let placemark = placemarks?.first else {
//                        return
//                    }
//
//                    guard let city = placemark.locality else {
//                        return
//                    }
//
//                    guard let state = placemark.administrativeArea else {
//                        return
//                    }
//
//                    currentCity = "\(city), \(state)"
//                })
            }
        } else {
            Text("Error Loading Location")
        }
    }
}
