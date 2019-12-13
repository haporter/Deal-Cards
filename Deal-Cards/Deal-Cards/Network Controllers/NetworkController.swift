//
//  NetworkController.swift
//  Deal-Cards
//
//  Created by Aaron Shackelford on 12/13/19.
//  Copyright © 2019 Andrew Porter. All rights reserved.
//


//
import Foundation

class NetworkController {
    
    static func fetchData(at url: URL, completion: @escaping (Result <Data?, NetworkError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("ERROR in \(#function) : \(error), \n---\n \(error.localizedDescription)")
                completion(.failure(.invalidURL))
            }
            guard let data = data else { return completion(.failure(.noData)) }
                print("Successfully fetched data.")
            completion(.success(data))
            
        }.resume()
    }
}

enum NetworkError: LocalizedError {
    case invalidURL
    case noData
}
