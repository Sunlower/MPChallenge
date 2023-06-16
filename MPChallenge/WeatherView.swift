//
//  WeatherView.swift
//  MPChallenge
//
//  Created by Vinícius Cavalcante on 16/06/23.
//

import SwiftUI
import MapKit

struct WeatherView: View {
    @ObservedObject var weatherKitManager = WeatherKitManager()
    @StateObject var locationDataManager = LocationDataManager()
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
                ZStack {
                    Map(coordinateRegion: $region, showsUserLocation: true)
                        .mask(
                            RoundedRectangle(cornerRadius: 24)
                                .fill(Color.blue)
                                .padding()
                                .frame(height: 201)
                        )
                        .overlay {
                            RoundedRectangle(cornerRadius: 24)
                                .fill(LinearGradient(gradient: Gradient(colors: [Color(hue: 256/360,
                                                                                       saturation: 10/100,
                                                                                       brightness: 10/100,
                                                                                       opacity: 0.4),
                                                                                 Color(hue: 256/360,
                                                                                       saturation: 10/100,
                                                                                       brightness: 10/100,
                                                                                       opacity: 0),
                                                                                 Color(hue: 256/360,
                                                                                       saturation: 10/100,
                                                                                       brightness: 10/100,
                                                                                       opacity: 0)]),
                                                                        startPoint: .top, endPoint: .bottom))
                                .padding()
                                .frame(height: 201)
                                .allowsHitTesting(false)
                        }

                    HStack {
                        Text(currentCity)
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.white)
                        Spacer()
                        Text(weatherKitManager.temp)
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.white)
                    }
                    .padding(.leading, 32)
                    .padding(.trailing, 32)
                    .padding(.bottom, 120)
                }
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

                    currentCity = "\(city), \(state)"
                })
            }
        } else {
            Text("Error Loading Location")
        }
    }
}
