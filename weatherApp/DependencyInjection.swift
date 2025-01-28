//
//  DependencyInjection.swift
//  weatherApp
//
//  Created by Lyle Reinholz on 1/28/25.
//

import Foundation
import Factory

extension Container {
    var userStorage: Factory<UserStorageProtocol> {
        Factory(self) { UserStorage() }
    }
    var weatherService: Factory<WeatherServiceProtocol> {
        Factory(self) { WeatherService() }
    }
    var weatherViewmodel: Factory<WeatherViewModel> {
        Factory(self) { WeatherViewModel() }
    }
}
