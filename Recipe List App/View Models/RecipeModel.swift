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
    
    static func getPortion(ingredient: Ingredient,
                    recipeServings:Int,
                    targetServings:Int) -> String {
       
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.num ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            
            denominator *= recipeServings
            
            numerator *= targetServings
            
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            if numerator >= denominator {
                
                // calculated whole portions
                wholePortions = numerator / denominator
                
                // calc of reminder
                numerator = numerator % denominator
                
                // Assign to portion stgring
                portion += String(wholePortions)
            }
            
            if numerator > 0 {
                portion += wholePortions > 0 ? " ":""
                portion += "\(numerator) / \(denominator)"
            }
        }
 
        // get a single serving size by multypling denominator by the recipe servings;
        
        if let unit = ingredient.unit {
            // calculate appropriate suffix
            portion += ingredient.num == nil && ingredient.denom == nil ? "": " "
            
            
            return portion + unit
        }
        
        return portion
          
        
    }
    
}
