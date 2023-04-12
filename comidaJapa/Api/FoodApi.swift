//
//  FoodApi.swift
//  comidaJapa
//
//  Created by Natanael Alves Pereira on 11/04/23.
//

import Foundation

enum FoodError: Error {
    case genericError
}

class FoodApi {
    
    private let baseUrl = "http://localhost:3000/produtos"
    
    func getFood(completion: @escaping(Result<[FoodModel], Error>) -> Void) {

        guard let url = URL(string: baseUrl) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { ( data, response, error ) in
        
            if let data = data {
                let decoder = JSONDecoder()
                
                if let model = try? decoder.decode([FoodModel].self, from: data) {
                    completion(.success(model))
                } else {
                    completion(.failure(FoodError.genericError))
                }
             
            } else {
                completion(.failure(FoodError.genericError))
            }
        }
        
        task.resume()
    }
}
    
