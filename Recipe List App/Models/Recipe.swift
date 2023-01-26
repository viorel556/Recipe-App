//
//  Recipe.swift
//  Recipe List App
//
//  Created by Viorel Harabaru  on 22.01.2023.
//

import Foundation

// making the model of one recipe:

class Recipe: Identifiable,
              Decodable {
    
    var id: UUID?
    
    var name:String
    var featured:Bool
    var image: String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var highlights:[String]
    var ingredients:[Ingredient]
    var directions:[String]

}

class Ingredient: Identifiable, Decodable {
    
    var id:UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
    
}
