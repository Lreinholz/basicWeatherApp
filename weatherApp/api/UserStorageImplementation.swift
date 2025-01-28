//
//  UserStorageImplementation.swift
//  waetherApp
//
//  Created by Lyle Reinholz on 1/28/25.
//

import Foundation

class UserStorage: UserStorageProtocol {
    private let savedCityKey = "SavedCity"
    
    func loadSavedCity() -> String? {
        UserDefaults.standard.string(forKey: savedCityKey)
    }
    
    func saveCity(_ city: String) {
        UserDefaults.standard.set(city, forKey: savedCityKey)
    }
    
    func clearCity() {
        UserDefaults.standard.removeObject(forKey: savedCityKey)
    }
}
