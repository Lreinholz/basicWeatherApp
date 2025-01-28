//
//  WeatherServiceProtocol.swift
//  waetherApp
//
//  Created by Lyle Reinholz on 1/27/25.
//

import Foundation

protocol WeatherServiceProtocol {
    func fetchWeather(for city: String, completion: @escaping (Result<WeatherInfo, Error>) -> Void)
}
