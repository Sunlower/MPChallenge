//
//  WeatherKitManager.swift
//  MPChallenge
//
//  Created by Vinícius Cavalcante on 16/06/23.
//

import Foundation
import WeatherKit

@MainActor class WeatherKitManager: ObservableObject {

    @Published var weather: Weather?

    func getWeather(latitude: Double, longitude: Double) async {
        do {
            weather = try await Task.detached(priority: .userInitiated) {
                return try await WeatherService.shared.weather(for: .init(latitude: latitude,
                                                                          longitude: longitude))
            }.value
        } catch {
            print("\(error)")
        }
    }

    var symbol: String {
        weather?.currentWeather.symbolName ?? "xmark"
    }

    var temp: String {
        let temp = weather?.currentWeather.temperature

        let convert = Int(temp?.converted(to: .celsius).value ?? 0.0).description
        return "\(convert)°C"

    }
}
