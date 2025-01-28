//
//  UserStorageProtocol.swift
//  waetherApp
//
//  Created by Lyle Reinholz on 1/28/25.
//

import Foundation

protocol UserStorageProtocol {
    func loadSavedCity() -> String?
    func saveCity(_ city: String)
    func clearCity()
}
