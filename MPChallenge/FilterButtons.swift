//
//  FilterButtons.swift
//  MPChallenge
//
//  Created by Vinícius Cavalcante on 19/06/23.
//

import SwiftUI
import MapKit

struct FilterButtons: View {
    @Binding var searchResults: [MKMapItem]
    @StateObject var locationDataManager = LocationDataManager()

    var body: some View {
        HStack {
            Button {
                search(for: "restaurant")
            } label: {
                Label("Restaurantes", systemImage: "fork.knife.circle")
            }
            .buttonStyle(.borderedProminent)
            Button {
                search(for: "beach")
            } label: {
                Label("Praias", systemImage: "beach.umbrella")
            }
            .buttonStyle(.borderedProminent)
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
            searchResults = response?.mapItems ?? []
        }
    }
}


