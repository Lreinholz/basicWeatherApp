//
//  WeatherInfo.swift
//  waetherApp
//
//  Created by Lyle Reinholz on 1/27/25.
//

import Foundation

/**
- Displays weather for a single **saved city**, including:
    - City name.
    - Temperature.
    - Weather condition (with corresponding icon from the API).
    - Humidity (%).
    - UV index.
    - "Feels like" temperature.
- If no city is saved, prompt the user to search.
- **Search bar** for querying new cities.
**/

struct WeatherInfo: Codable {
    let cityName: String
    let temperature: Double
    let weatherCondition: String
    let icon: String
    let humidity: Int
    let uvIndex: Double
    let feelsLike: Double

    var temperatureString: String {
        return String(format: "%.0f", temperature)
    }

    var feelsLikeString: String {
        return String(format: "%.0f °", feelsLike)
    }

    var humidityString: String {
        return "\(humidity)%"
    }

    var uvIndexString: String {
        return "\(uvIndex)"
    }
}
