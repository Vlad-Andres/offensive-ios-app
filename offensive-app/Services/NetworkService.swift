//
//  NetworkService.swift
//  offensive-app
//
//  Created by Vlad Andres on 28/08/2024.
//

import Foundation

class NetworkService {
    private var url: URL = URL(string: "https://evilinsult.com/generate_insult.php?lang=en&type=json")!
    
    func fetchData(completion: @escaping (Result<String, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let responseString = String(data: data, encoding: .utf8) {
                completion(.success(responseString))
            } else if let error = error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
