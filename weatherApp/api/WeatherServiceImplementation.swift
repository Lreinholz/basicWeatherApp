//
//  WeatherServiceImplementation.swift
//  waetherApp
//
//  Created by Lyle Reinholz on 1/27/25.
//

import Foundation

class WeatherService: WeatherServiceProtocol {
    private let apiKey = "ENTER_API_KEY"
    
    func fetchWeather(for city: String, completion: @escaping (Result<WeatherInfo, Error>) -> Void) {
        let urlString = "https://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(city)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 404, userInfo: nil)))
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                
                guard let location = json?["location"] as? [String: Any],
                      let current = json?["current"] as? [String: Any],
                      let condition = current["condition"] as? [String: Any] else {
                    completion(.failure(NSError(domain: "Malformed JSON", code: 500, userInfo: nil)))
                    return
                }
                
                let cityName = location["name"] as? String ?? "Unknown City"
                let temperature = current["temp_c"] as? Double ?? 0.0
                let feelsLike = current["feelslike_c"] as? Double ?? 0.0
                let humidity = current["humidity"] as? Int ?? 0
                let weatherCondition = condition["text"] as? String ?? "Unknown"
                let icon = condition["icon"] as? String ?? ""
                let uvIndex = current["uv"] as? Double ?? 0.0
                
                let weatherInfo = WeatherInfo(
                    cityName: cityName,
                    temperature: temperature,
                    weatherCondition: weatherCondition,
                    icon: icon,
                    humidity: humidity,
                    uvIndex: uvIndex,
                    feelsLike: feelsLike
                )
                
                completion(.success(weatherInfo))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
