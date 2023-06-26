//
//  FilterButtons.swift
//  MPChallenge
//
//  Created by Vinícius Cavalcante on 19/06/23.
//

import SwiftUI
import MapKit

struct TagButton: View {
    @Binding var searchResults: [MKMapItem]
    @Binding var searchLocations: [Location]
    @StateObject var locationDataManager = LocationDataManager()
    @State var isActivate: Bool = false
    @State var searchCurrent: [MKMapItem]
    @State var searchCurrentLocations: [Location]

    let filterTag: Tag

    var body: some View {
        HStack {
            Button {
                isActivate.toggle()
                if isActivate == true {
                    search(query: filterTag.searchText, category: filterTag.pointOfInterest)
                } else {
//                    searchResults
                    searchResults = searchResults.filter {!searchCurrent.contains($0)}
                    searchLocations = searchLocations.filter {!searchCurrentLocations.contains($0)}
                }
//                search(for: "restaurant")

            } label: {
                if isActivate == true {
//                    Label("Restaurantes", systemImage: "fork.knife.circle")
                    HStack {
                        Image(systemName: filterTag.iconName)
                            .foregroundStyle(.white)
                        Text(filterTag.name)
                            .foregroundStyle(.white)
                    }
                    .padding()
                    .background {
                        Capsule()
                            .fill(Color(hue: 15/360, saturation: 38/100, brightness: 67/100))
                            .frame(height: 32)

                    }
                    
                } else {
                    HStack{
                        Image(systemName: filterTag.iconName)
                            .foregroundStyle(Color(hue: 15/360, saturation: 38/100, brightness: 67/100))
                        Text(filterTag.name)
                            .foregroundStyle(Color(hue: 15/360, saturation: 38/100, brightness: 67/100))

                    }
                    .padding()
                    .background{
                        Capsule()
                            .stroke(Color(hue: 15/360, saturation: 38/100, brightness: 67/100), lineWidth: 2)
                            .frame(height: 32)

                    }
                }
            }
        }
    }

    func search (query: String, category: MKPointOfInterestCategory) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.pointOfInterestFilter = .some(MKPointOfInterestFilter(including: [category]))
        request.resultTypes = .pointOfInterest
        request.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locationDataManager.latitude, longitude: locationDataManager.longitude), span: MKCoordinateSpan(latitudeDelta: 0.0125, longitudeDelta: 0.0125))
        Task {
            let search = MKLocalSearch(request: request)
            let response = try? await search.start()

            searchResults.append(contentsOf: response?.mapItems ?? [])
            searchCurrent = response?.mapItems ?? []

            searchLocations = searchResults.map(Location.init) // depois estudar Mapper
            searchCurrentLocations = searchCurrent.map(Location.init)
        }
    }

//    func search (for query: [MKPointOfInterestCategory]) {
//        let request = MKLocalSearch.Request()
//        request.naturalLanguageQuery = query
//        request.resultTypes = query
//        request.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locationDataManager.latitude, longitude: locationDataManager.longitude), span: MKCoordinateSpan(latitudeDelta: 0.0125, longitudeDelta: 0.0125))
//        Task {
//            let search = MKLocalSearch(request: request)
//            let response = try? await search.start()
//
//            searchResults.append(contentsOf: response?.mapItems ?? [])
//            searchCurrent = response?.mapItems ?? []
//        }
//    }
}

