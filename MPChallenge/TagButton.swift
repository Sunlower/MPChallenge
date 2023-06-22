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
    @StateObject var locationDataManager = LocationDataManager()
    @State var isActivate: Bool = false
    @State var searchCurrent: [MKMapItem]
    
    let filterTag: Tag

    var body: some View {
        HStack {
            Button {
                isActivate.toggle()
                if isActivate == true {
                    search(for: filterTag.pointOfInterest)
                } else {
//                    searchResults
                    searchResults = searchResults.filter {!searchCurrent.contains($0)}
                }
//                search(for: "restaurant")

            } label: {
                if isActivate == true {
//                    Label("Restaurantes", systemImage: "fork.knife.circle")
                    HStack{
                        Image(systemName: filterTag.iconName)
                            .foregroundStyle(.white)
                        Text(filterTag.name)
                            .foregroundStyle(.white)
                    }
                    .padding()
                    .background {
                        Capsule()
                            .fill(.blue)
                            .frame(height: 32)

                    }
                    
                } else {
                    HStack{
                        Image(systemName: filterTag.iconName)
                            .foregroundStyle(.blue)
                        Text(filterTag.name)
                            .foregroundStyle(.blue)
                            
                    }
                    .padding()
                    .background{
                        Capsule()
                            .stroke(.blue, lineWidth: 2)
                            .frame(height: 32)

                    }
                }
            }
        }
    }

    func search (for query: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        request.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locationDataManager.latitude, longitude: locationDataManager.longitude), span: MKCoordinateSpan(latitudeDelta: 0.0125, longitudeDelta: 0.0125))
        Task {
            let search = MKLocalSearch(request: request)
            let response = try? await search.start()
//            searchResults = response?.mapItems ?? []
//            searchResults.append(contentsOf: response?.mapItems ?? [])

            searchResults.append(contentsOf: response?.mapItems ?? [])
            searchCurrent = response?.mapItems ?? []
        }
    }
}

