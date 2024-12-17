//
//  Cat.swift
//  CatAPI
//
//  Created by Jorge Palomino on 13/06/2024.
//

import Foundation

// MARK: - Cat
struct Cat: Codable, Identifiable, Equatable {
    
    let breeds: [Breed]?
    let id: String
    let url: String
    let width, height: Int
    
    static func == (lhs: Cat, rhs: Cat) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: - CatMockData
struct CatMockData {
    static let sampleCat = Cat(breeds: [BreedMockData.sampleBreed, BreedMockData.otherSampleBreed], id: "wFQIf01uy", url: "https://cdn2.thecatapi.com/images/wFQIf01uy.jpg", width: 1000, height: 800)
    static let otherSampleCat = Cat(breeds: [BreedMockData.sampleBreed, BreedMockData.otherSampleBreed], id: "s42I_BL-a", url: "https://cdn2.thecatapi.com/images/s42I_BL-a.jpg", width: 1620, height: 1080)
    static let anotherSampleCat = Cat(breeds: [BreedMockData.sampleBreed, BreedMockData.otherSampleBreed], id: "Oaoo1ky3A", url: "https://cdn2.thecatapi.com/images/Oaoo1ky3A.jpg", width: 3878, height: 2771)
    static let lastSampleCat = Cat(breeds: [BreedMockData.sampleBreed, BreedMockData.otherSampleBreed], id: "p46ys1bGF", url: "https://cdn2.thecatapi.com/images/p46ys1bGF.jpg", width: 1620, height: 1080)
}
