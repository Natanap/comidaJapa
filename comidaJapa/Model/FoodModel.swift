//
//  FoodModel.swift
//  comidaJapa
//
//  Created by Natanael Alves Pereira on 11/04/23.
//

import Foundation

struct FoodModel: Codable {
    
    let id: Int
    let name: String
    let img: String
    let description: String
    
    init() {
        id = 0
        name = ""
        img = ""
        description = ""
    }
    
    init(id: Int, name: String, img: String, description: String){
        self.id = id
        self.name = name
        self.img = img
        self.description = description
    }
}
