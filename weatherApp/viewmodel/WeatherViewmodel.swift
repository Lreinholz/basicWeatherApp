//
//  WeatherViewmodel.swift
//  waetherApp
//
//  Created by Lyle Reinholz on 1/28/25.
//

import Foundation
import Combine
import Factory

enum WeatherScreenState {
    case card
    case info
    case enterCity
}

class WeatherViewModel: ObservableObject {
    @Published var weatherInfo: WeatherInfo?
    @Published var errorMessage: String?
    @Published var city: String = ""
    @Published var savedCity: String?

    private let userStorage = Container.shared.userStorage()
    private let weatherService = Container.shared.weatherService()
    
    private var debounceTimer = PassthroughSubject<String, Never>()
    private var cancellables = Set<AnyCancellable>()
    
    var screenState: WeatherScreenState {
        if let _ = weatherInfo, savedCity != nil {
            return .info
        } else if let _ = weatherInfo, savedCity == nil {
            return .card
        } else {
            return .enterCity
        }    }
    
    init() {
        loadSavedCityAndFetchWeather()
        
        $city
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink { [weak self] debouncedCity in
                self?.fetchWeather(for: debouncedCity)
                self?.clearSaved()
            }
            .store(in: &cancellables)
    }
    
    private func loadSavedCityAndFetchWeather() {
        if let savedCity = userStorage.loadSavedCity() {
            self.savedCity = savedCity
            fetchWeather(for: savedCity)
        }
    }
    
    func saveSelectedCity() {
        guard let city = weatherInfo?.cityName else { return }
        userStorage.saveCity(city)
        savedCity = city
    }
    
    func clearSaved() {
        userStorage.clearCity()
        savedCity = nil
        weatherInfo = nil
    }
    
    private func fetchWeather(for city: String) {
        guard city.count > 3 else { return }
        
        weatherService.fetchWeather(for: city) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let weatherInfo):
                    self?.weatherInfo = weatherInfo
                    self?.errorMessage = nil
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    self?.weatherInfo = nil
                }
            }
        }
    }
}
