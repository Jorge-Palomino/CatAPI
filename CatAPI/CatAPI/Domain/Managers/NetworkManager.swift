//
//  NetworkManager.swift
//  CatAPI
//
//  Created by Jorge Palomino on 13/06/2024.
//

import Foundation
import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://api.thecatapi.com/v1/"
    
    private let searchImages = baseURL + "images/search" //?has_breeds=true"
    private let searchBreed = baseURL + "images/search"
    
    private init() {}

    
    enum NetworkError:Error {
        case invalidUrl
        case invalidResponse        
        
        var description: String {
            switch self {
            case .invalidUrl: return "Invalid URL"
            case .invalidResponse: return "Error decoding response"
            }
        }
    }
    
    func getRandomCats(limit: Int = 1) async throws -> [Cat]  {
        guard let url = URL(string: searchImages + "?limit=\(limit)") else {
            throw NetworkError.invalidUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(Config.apiKey, forHTTPHeaderField: "x-api-key")
        
        let (data, _) =  try await URLSession.shared.data(for: request)
     
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode([Cat].self, from: data)
            return decodedResponse
        } catch {
            throw NetworkError.invalidResponse
        }
    }
    
    func getCats(limit: Int = 4, for breedId: String) async throws -> [Cat]  {
        guard let url = URL(string: searchBreed + "?limit=\(limit)" + "&breed_ids=\(breedId)") else {
            throw NetworkError.invalidUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(Config.apiKey, forHTTPHeaderField: "x-api-key")
        
        let (data, _) =  try await URLSession.shared.data(for: request)
     
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode([Cat].self, from: data)
            return decodedResponse
        } catch {
            throw NetworkError.invalidResponse
        }
    }
    
    func downloadImage(fromURLString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string:fromURLString)
        
        if let image = cache.object(forKey: cacheKey){
            completed(image)
            return
        }
        
        guard let url = URL(string: fromURLString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
           
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            
            completed(image)
        }
        
        task.resume()
    }
    
}
