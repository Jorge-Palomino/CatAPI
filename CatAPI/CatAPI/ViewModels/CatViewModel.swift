//
//  CatViewModel.swift
//  CatAPI
//
//  Created by Jorge Palomino on 13/06/2024.
//

import Foundation

@MainActor class CatViewModel: ObservableObject {
    
    enum State: Comparable {
        case good
        case isLoading
        case error(String)
    }
    
    @Published var cats: [Cat] = []
    @Published var isShowingDetail = false
    @Published var selectedBreed: Breed = BreedMockData.sampleBreed
    @Published var breedCats: [Cat] = []
    @Published var state: State = .good
    @Published var showError = false
    
    init() {
        self.state = .good
        self.cats = []
    }
    
    func getRandomCat() async {
        guard state != State.isLoading else {
            return
        }
        
        state = .isLoading
        showError = false
        
        do {
            let catResponse = try await NetworkManager.shared.getRandomCats()
            self.cats = catResponse
            self.state = .good
        }catch {
            self.showError = true
            if let error = error as? NetworkManager.NetworkError {
                self.state = .error("Could not load: \(error.description)")
            }else {
                self.state = .error("Could not load: \(error.localizedDescription)")
            }
        }
    }
    
    func getCats(for breedId: String) async {
        guard state != State.isLoading else {
            return
        }
        
        state = .isLoading
        showError = false
        
        do {
            let catResponse = try await NetworkManager.shared.getCats(for: selectedBreed.id)
            self.breedCats = catResponse
            self.state = .good
            self.isShowingDetail = true
        }catch {
            self.showError = true
            if let error = error as? NetworkManager.NetworkError {
                self.state = .error("Could not load: \(error.description)")
            }else {
                self.state = .error("Could not load: \(error.localizedDescription)")                
            }
        }
    }
}
