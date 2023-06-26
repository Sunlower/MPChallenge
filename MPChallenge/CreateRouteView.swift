//
//  CreateRouteView.swift
//  MPChallenge
//
//  Created by Vinícius Cavalcante on 19/06/23.
//

import SwiftUI
import MapKit

extension Location {

    func distance(to coordinate: (Double, Double)) -> Double {
        return local.placemark.location?.distance(from: CLLocation(latitude: coordinate.0, longitude: coordinate.1)).magnitude ?? 0
    }

}

struct CreateRouteView: View {
    @StateObject var locationDataManager = LocationDataManager()
    //    @ObservedObject var weatherKitManager = WeatherKitManager()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.83834587046632,
                                       longitude: 14.254053016537693),
        span: MKCoordinateSpan(latitudeDelta: 0.05,
                               longitudeDelta: 0.05)
    )

    //    @State private var currentCity = "Carregando..."
    @State private var searchResults: [MKMapItem] = []
    @State var searchLocations: [Location] = []
    @State var searchCurrentLocations: [Location] = []
    @State var searchCurrent: [MKMapItem] = []
    @State var isSelectedLocation : [Location] = []
    let options = [
        MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving,
        MKLaunchOptionsShowsTrafficKey: true
    ] as [String: Any]

    var body: some View {
        if locationDataManager.authorizationStatus == .authorizedWhenInUse {
            VStack {
                HStack {
                    Spacer()
                    Button {
                        if !isSelectedLocation.isEmpty {
                            MKMapItem.openMaps(
                                with: {
                                    var results = [MKMapItem.forCurrentLocation()]
                                    results.append(contentsOf: isSelectedLocation.map(\.local))
                                    return results
                                }(),
                                launchOptions: options
                            )
                        }

                    } label: {
                        if isSelectedLocation.isEmpty {
                            Text("Criar rota")
                                .font(.caption)
                                .bold()
                                .foregroundStyle(Color(hue: 0, saturation: 0, brightness: 53/100))
                                .padding(6)
                                .background {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color(hue: 0, saturation: 0, brightness: 0.53, opacity: 0.4))
                                }
                        } else {
                            Text("Criar rota")
                                .font(.caption)
                                .bold()
                                .foregroundStyle(.white)
                                .padding(6)
                                .background {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color(hue: 15/360, saturation: 38/100, brightness: 67/100))
                                }
                        }

                    }
                }
                .padding(.trailing)

                CreateRoteWeatherStatusView()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(Tag.allTags, id: \.name) { filterTag in
                            TagButton(
                                searchResults: $searchResults,
                                searchLocations: $searchLocations,
                                searchCurrent: searchCurrent,
                                searchCurrentLocations: searchCurrentLocations,
                                filterTag: filterTag
                            )
                        }
                    }
                    .padding(.leading)
                    .padding(.trailing)
                }
                ScrollView {
                    ForEach($searchLocations, id: \.local){ $result in
                        VStack(alignment: .leading) {
                            HStack {
                                Button {
                                    result.isSelected.toggle()
                                    isSelectedLocation = searchLocations.filter {$0.isSelected}
//                                    isSelectedLocation.append(contentsOf: searchLocations.filter {$0.isSelected})
                                    print(isSelectedLocation)
                                } label: {
                                    if result.isSelected{
                                        Image(systemName: "checkmark.circle.fill")
                                            .font(.title2)
                                            .foregroundStyle(Color(hue: 201/360, saturation: 52/100, brightness: 44/100))

                                    } else {
                                        Image(systemName: "circle")
                                            .font(.title2)
                                            .foregroundStyle(Color(hue: 201/360, saturation: 52/100, brightness: 44/100))
                                    }
                                }
                                Line()
                                    .stroke(Color.black, style: StrokeStyle(lineWidth: 1, lineCap: .butt, lineJoin: .miter, dash: [5]))
                                    .frame(width: 1)
                                Image(result.imageName)
                                    .resizable()
                                    .frame(width: 60, height: 65)
                                VStack(alignment: .leading) {
                                    Text(result.local.name ?? " ")
                                        .font(.title3)
                                        .bold()
                                        .lineLimit(1)
                                    Spacer()
                                    HStack {
                                        HStack {
                                            Image(
                                                systemName: result.tagCategory.iconName)
                                                .foregroundStyle(.white)
                                                .font(.caption)
                                            Text(result.tagCategory.name)
                                                .foregroundStyle(.white)
                                                .font(.caption)
                                        }
                                        .padding(.leading, 8)
                                        .padding(.trailing, 8)
                                        .background {
                                            Capsule()
                                                .fill(Color(hue: 15/360, saturation: 38/100, brightness: 67/100))
                                                .frame(height: 24)
                                        }
                                        .padding(.bottom, 4)
                                    }

                                }
                                .frame(maxWidth: .infinity, alignment: .leading)

                            }
                            .padding()
                        }
                        .background {
                            if result.isSelected{
                                ZStack{
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(lineWidth: 1)
                                        .frame(maxWidth: .infinity)
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color(hue: 31/360, saturation: 44/100, brightness: 87/100, opacity: 0.4))
                                        .frame(maxWidth: .infinity)
                                }
                            } else {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(lineWidth: 1)
                                    .frame(maxWidth: .infinity)
                            }

                        }

                        .padding()
                    }
                }
            }
            .onAppear {
                searchLocations = searchLocations.sorted{ $0.distance(to: locationDataManager.coordinate) < $1.distance(to: locationDataManager.coordinate) }
                region = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: locationDataManager.latitude,
                        longitude: locationDataManager.longitude),
                    span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
                )
            }
        } else {
            ZStack{
                Rectangle()
                    .fill(Color(hue: 203/360, saturation: 24/100, brightness: 93/100))
                    .ignoresSafeArea()
                VStack{
                    Image("emptyState")
                    Text("Autorize a localização em tempo real para selecionar seus locais e criar suas rotas.")
                        .font(.title3)

                }
                .padding()
            }
        }
    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
        }
    }
}
