//
//  Breed.swift
//  CatAPI
//
//  Created by Jorge Palomino on 13/06/2024.
//

import Foundation

// MARK: - Breed
struct Breed: Codable, Identifiable {
    let id, name, temperament, origin: String

    enum CodingKeys: String, CodingKey {
        case id, name, temperament, origin
    }
}

// MARK: - BreedMockData
struct BreedMockData {
    static let sampleBreed = Breed(id: "bamb", name: "Bambino", temperament: "Affectionate, Lively, Friendly, Intelligent", origin: "United States")
    static let otherSampleBreed = Breed(id: "crex", name: "Cornish Rex", temperament: "Affectionate, Intelligent, Active, Curious, Playful", origin: "United Kingdom")
}
