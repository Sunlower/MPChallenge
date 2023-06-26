//
//  MapView.swift
//  NovoWatch Watch App
//
//  Created by Ieda Xavier on 22/06/23.
//

import SwiftUI
import MapKit

struct MapView: View {

    @ObservedObject var locationDelegate: LocationDelegate
    @State var mode = MapUserTrackingMode.follow

    var body: some View {
        ZStack(alignment: .bottom) {
            Map(coordinateRegion: $locationDelegate.coordRegion, interactionModes: .all, showsUserLocation: true, userTrackingMode: $mode)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            CardInstructions()
        }
    }
}

struct MapView_Previews: PreviewProvider {

    static var previews: some View {
        MapView(locationDelegate: LocationDelegate())
    }
}
