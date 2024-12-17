//
//  CatAPIAPITests.swift
//  CatAPITests
//
//  Created by Jorge Palomino on 13/06/2024.
//

import XCTest
@testable import CatAPI

final class CatAPIAPITests: XCTestCase {
    
    func testGetRandomCats() async {
        do {
            let catResponse = try await NetworkManager.shared.getRandomCats()
            XCTAssertGreaterThan(catResponse.count, 0)
        }catch {
            XCTFail("Error in request: \(error)")
        }
    }
    
    func testGetBreed() async {
        do {
            let catsResponse = try await NetworkManager.shared.getCats(for: BreedMockData.sampleBreed.id)
            XCTAssertGreaterThan(catsResponse.count, 0)
        }catch {
            XCTFail("Error in request: \(error)")
        }
    }
    
    func testDownloadImage() {
        let testUrl = "https://cdn2.thecatapi.com/images/wFQIf01uy.jpg"
        NetworkManager.shared.downloadImage(fromURLString: testUrl) { uiImage in
            XCTAssertNotNil(uiImage)
        }
    }
}
