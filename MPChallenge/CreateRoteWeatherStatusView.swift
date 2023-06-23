//
//  CreateRoteWeatherStatusView.swift
//  MPChallenge
//
//  Created by Vinícius Cavalcante on 22/06/23.
//

import SwiftUI
import MapKit

struct CreateRoteWeatherStatusView: View {
    @StateObject var locationDataManager = LocationDataManager()
    @ObservedObject var weatherKitManager = WeatherKitManager()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.83834587046632,
                                       longitude: 14.254053016537693),
        span: MKCoordinateSpan(latitudeDelta: 0.05,
                               longitudeDelta: 0.05)
    )
    @State private var currentCity = "Carregando..."
    
    var body: some View {
        if locationDataManager.authorizationStatus == .authorizedWhenInUse {
            VStack {
                RoundedRectangle(cornerRadius: 22)
                    .fill(LinearGradient(colors: [.purple, .blue], startPoint: .top, endPoint: .bottom))
                    .frame(width: 357, height: 132)
                    .overlay {
                        VStack {
                            HStack(alignment: .top) {
                                Text(currentCity)
                                    .font(.title2)
                                    .bold()
                                    .foregroundStyle(.white)
                                Spacer()
                                Image(systemName: weatherKitManager.symbol)
                                    .font(.title2)
                                    .bold()
                                    .foregroundStyle(.white)
                                Text(weatherKitManager.temp)
                                    .font(.title2)
                                    .bold()
                                    .foregroundStyle(.white)
                            }
                            .padding()
                            Spacer()
                        }
                    }
                    .padding()
            }
            .task {
                await weatherKitManager.getWeather(latitude: locationDataManager.latitude,
                                                   longitude: locationDataManager.longitude)

            }
            .onAppear {
                region = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: locationDataManager.latitude,
                        longitude: locationDataManager.longitude),
                        span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
                )
                let geocoder = CLGeocoder()
                let location = CLLocation(latitude: region.center.latitude,
                                          longitude: region.center.longitude)
                geocoder.reverseGeocodeLocation(location, completionHandler: { placemarks, _ -> Void in

                    guard let placemark = placemarks?.first else {
                        return
                    }

                    guard let city = placemark.locality else {
                        return
                    }

                    guard let state = placemark.administrativeArea else {
                        return
                    }
                    guard let street = placemark.thoroughfare else {
                        return
                    }
                    guard let number = placemark.subThoroughfare else {
                        return
                    }

                    currentCity = "\(city), \(state)"
                })
            }
        } else {
            Text("Error Loading Location")
        }
    }
}
