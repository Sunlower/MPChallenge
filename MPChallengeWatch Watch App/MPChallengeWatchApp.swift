//
//  MPChallengeWatchApp.swift
//  MPChallengeWatch Watch App
//
//  Created by Ieda Xavier on 23/06/23.
//

import SwiftUI
import CoreLocation

@main
struct MPChallengeWatch_Watch_AppApp: App {
    let manager = CLLocationManager()
        let locationDelegate = LocationDelegate()

        init(){
            manager.delegate = locationDelegate
            manager.allowsBackgroundLocationUpdates = true
            manager.distanceFilter = 15


            manager.requestAlwaysAuthorization()

            manager.startUpdatingLocation()
        }


        var body: some Scene {
            WindowGroup {
                HomeView(locationDelegate: locationDelegate)
            }
        }
}
