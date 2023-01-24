//
//  recipeModel.swift
//  Recipe List App
//
//  Created by Viorel Harabaru  on 22.01.2023.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    
    init() {
        
        // using the parsing method we created:
        // note that the method was defined as "Static" so we can use...
        self.recipes = DataService.getLocalData()

    }
}
