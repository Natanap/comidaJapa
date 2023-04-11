//
//  FoodApi.swift
//  comidaJapa
//
//  Created by Natanael Alves Pereira on 11/04/23.
//

import Foundation

class FoodApi {
    
    private let baseUrl = "https://app-produtos-japonesa.herokuapp.com/produtos"
    
    func getFood(completion: @escaping([FoodModel], Error?) -> Void) {

        guard let url = URL(string: baseUrl) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { ( data, response, error ) in
        
            if let data = data {
                let decoder = JSONDecoder()
                let json = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                print(data, "Aqui")
                guard let model = try? decoder.decode([FoodModel].self, from: data)
                else {
                    completion([], error)
                    return
                }
            } else {
                print("error")
                return
            }
            
            
            
//            if let data = data {
//                let decoder = JSONDecoder()
//
//                guard let model = try? decoder.decode([FoodModel].self, from: data)
//                else {
//                    completion([], error)
//                    return
//                }
//
//                print(model)
//
//                completion(model, nil)
//            }
        }
        
        task.resume()
    }
}
    
