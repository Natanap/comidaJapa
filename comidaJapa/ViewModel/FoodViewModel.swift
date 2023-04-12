//
//  FoodViewModel.swift
//  comidaJapa
//
//  Created by Natanael Alves Pereira on 11/04/23.
//

import Foundation

struct FoodViewModel {
    var model: [FoodModel]
    
    init() {
        self.model = [FoodModel]()
    }
    
    init(model: [FoodModel]) {
        self.model = model
    }
    
}
