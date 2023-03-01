//
//  APIService.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 28/02/2023.
//

import Foundation

enum APIEndpoint: String {
    case character, location, episode
}

final class APIService {
    
    static let baseUrl = "https://rickandmortyapi.com/api/"
    
    static let shared = APIService()
    
    private init() {}
    
    enum APIError: Error {
        case failedToCreateRequest
        case failedToGetData
        case failedToDecode
    }
    
    
    /// This method is responsible for fetching data from the Rick & Morty API
    /// - Parameters:
    ///   - url: Takes the endpoint Url
    ///   - type: Takes the expected type to return
    ///   - completion: Completion handler
    public func execute<T: Codable>(
        url: String,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let url = URL(string: url) else {
            completion(.failure(APIError.failedToCreateRequest))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data, error == nil else {
                completion(.failure(APIError.failedToGetData))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(APIError.failedToDecode))
                return
            }
        }
        
        task.resume()
    }
}
