//
//  FodApi.swift
//  comidaJapa
//
//  Created by Natanael Alves Pereira on 11/04/23.
//

import Foundation

class FodApi {
    
    var models = [FoodModel]()
    
    func fecthData() {
        let baseUrl = "https://app-produtos-japonesa.herokuapp.com/produtos"
        guard let url = URL(string: baseUrl) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, error == nil else {
                print("Error na localizacao")
                return
            }
            var model = [FoodModel]()
            do{
                model = try JSONDecoder().decode([FoodModel].self, from: data)
            }catch {
                print("error")
            }
            self.models = model
        }
        task.resume()
    }
}
