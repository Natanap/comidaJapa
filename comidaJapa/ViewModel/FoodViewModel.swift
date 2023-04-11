//
//  FoodViewModel.swift
//  comidaJapa
//
//  Created by Natanael Alves Pereira on 11/04/23.
//

import Foundation

struct FoodViewModel {
    private var model: [FoodModel]
    
    init() {
        self.model = [FoodModel()]
    }
    
    init(model: [FoodModel]) {
        self.model = model
    }
    
//    var id: Int {
//        model.id
//    }
//    
//    var name: String {
//        model.name
//    }
//    
//    var img: String {
//        model.img
//    }
//    
//    var description: String {
//        model.description
//    }
}
