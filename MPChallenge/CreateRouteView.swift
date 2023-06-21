//
//  CreateRouteView.swift
//  MPChallenge
//
//  Created by Vinícius Cavalcante on 19/06/23.
//

import SwiftUI
import MapKit

extension MKMapItem {

    func distance(to coordinate: (Double, Double)) -> Double {
        return placemark.location?.distance(from: CLLocation(latitude: coordinate.0, longitude: coordinate.1)).magnitude ?? 0
    }

}

struct CreateRouteView: View {
    @StateObject var locationDataManager = LocationDataManager()
    @ObservedObject var weatherKitManager = WeatherKitManager()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.83834587046632,
                                       longitude: 14.254053016537693),
        span: MKCoordinateSpan(latitudeDelta: 0.05,
                               longitudeDelta: 0.05)
    )

    @State private var currentCity = "Carregando..."
    @State private var searchResults: [MKMapItem] = []
    @State private var searchCurrent: [MKMapItem] = []

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
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(Tag.allTags, id: \.name) { filterTag in
                            TagButton(searchResults: $searchResults, searchCurrent: $searchCurrent, filterTag: filterTag)
                        }
                    }
                    .padding(.leading)
                    .padding(.trailing)
                }
//                List(searchResults.sorted{ $0.distance(to: locationDataManager.coordinate) < $1.distance(to: locationDataManager.coordinate) }, id: \.self) { result in
//                    VStack (alignment: .leading) {
//                        Text(result.name ?? "")
//                        Text(result.distance(to: locationDataManager.coordinate).description)
//                    }
//                }
                ScrollView {
                    ForEach(searchResults.sorted{ $0.distance(to: locationDataManager.coordinate) < $1.distance(to: locationDataManager.coordinate) }, id: \.self){ result in

                        VStack(alignment: .leading) {
                            HStack {
                                Image("teste")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .padding(.leading)
                                VStack(alignment: .leading) {
                                    Text(result.name ?? " ")
                                        .font(.title3)
                                        .bold()
                                        .lineLimit(1)
                                    HStack {
                                        Image(systemName: "car")
                                            .foregroundStyle(.white)
                                        Text("Teste")
                                            .foregroundStyle(.white)
                                    }
                                    .padding()
                                    .background {
                                        Capsule()
                                            .fill(.blue)
                                            .frame(height: 32)
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                            }
                        }
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 1)
                                .frame(maxWidth: .infinity)
                        }
//                        .padding(.top)
//                        .padding(.bottom)
                        .padding()
                        }
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
