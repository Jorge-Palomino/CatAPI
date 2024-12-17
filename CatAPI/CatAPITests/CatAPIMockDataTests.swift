//
//  CatAPIMockDataTests.swift
//  CatAPITests
//
//  Created by Jorge Palomino on 13/06/2024.
//

import XCTest
@testable import CatAPI

final class CatAPIMockDataTests: XCTestCase {
    
    func testCatDecoding() {
        let json = """
        [
            {
                "breeds": [
                    {
                        "weight": {
                            "imperial": "8 - 17",
                            "metric": "4 - 8"
                        },
                        "id": "pixi",
                        "name": "Pixie-bob",
                        "vetstreet_url": "http://www.vetstreet.com/cats/pixiebob",
                        "temperament": "Affectionate, Social, Intelligent, Loyal",
                        "origin": "United States",
                        "country_codes": "US",
                        "country_code": "US",
                        "description": "Companionable and affectionate, the Pixie-bob wants to be an integral part of the family. The Pixie-Bob’s ability to bond with their humans along with their patient personas make them excellent companions for children.",
                        "life_span": "13 - 16",
                        "indoor": 0,
                        "lap": 1,
                        "alt_names": "",
                        "adaptability": 5,
                        "affection_level": 5,
                        "child_friendly": 4,
                        "dog_friendly": 5,
                        "energy_level": 4,
                        "grooming": 1,
                        "health_issues": 2,
                        "intelligence": 5,
                        "shedding_level": 3,
                        "social_needs": 4,
                        "stranger_friendly": 4,
                        "vocalisation": 1,
                        "experimental": 0,
                        "hairless": 0,
                        "natural": 0,
                        "rare": 0,
                        "rex": 0,
                        "suppressed_tail": 1,
                        "short_legs": 0,
                        "wikipedia_url": "https://en.wikipedia.org/wiki/Pixiebob",
                        "hypoallergenic": 0,
                        "reference_image_id": "z7fJRNeN6"
                    }
                ],
                "id": "zEpUrnbJg",
                "url": "https://cdn2.thecatapi.com/images/zEpUrnbJg.jpg",
                "width": 1600,
                "height": 1067
            }
        ]
        """.data(using: .utf8)!

        let decoder = JSONDecoder()
        do {
            let cats = try decoder.decode([Cat].self, from: json)
            XCTAssertEqual(cats.count, 1)
            let cat = cats.first
            XCTAssertEqual(cat?.id, "zEpUrnbJg")
            XCTAssertEqual(cat?.url, "https://cdn2.thecatapi.com/images/zEpUrnbJg.jpg")
            XCTAssertEqual(cat?.width, 1600)
            XCTAssertEqual(cat?.height, 1067)
            XCTAssertEqual(cat?.breeds?.count, 1)
            
            let breed = cat?.breeds?.first
            XCTAssertEqual(breed?.id, "pixi")
            XCTAssertEqual(breed?.name, "Pixie-bob")
            XCTAssertEqual(breed?.temperament, "Affectionate, Social, Intelligent, Loyal")
            XCTAssertEqual(breed?.origin, "United States")
        } catch {
            XCTFail("Decoding failed: \(error)")
        }
    }
    
    func testCatInitialization() {
        let cat = CatMockData.sampleCat
        XCTAssertEqual(cat.id, "wFQIf01uy")
        XCTAssertEqual(cat.url, "https://cdn2.thecatapi.com/images/wFQIf01uy.jpg")
        XCTAssertEqual(cat.width, 1000)
        XCTAssertEqual(cat.height, 800)
        let breed = cat.breeds?.first
        XCTAssertEqual(breed?.id, "bamb")
        XCTAssertEqual(breed?.name, "Bambino")
        XCTAssertEqual(breed?.temperament, "Affectionate, Lively, Friendly, Intelligent")
        XCTAssertEqual(breed?.origin, "United States")
    }
    
    func testBreedInitialization() {
        let breed = BreedMockData.otherSampleBreed
        XCTAssertEqual(breed.id, "crex")
        XCTAssertEqual(breed.name, "Cornish Rex")
        XCTAssertEqual(breed.temperament, "Affectionate, Intelligent, Active, Curious, Playful")
        XCTAssertEqual(breed.origin, "United Kingdom")
    }
}
