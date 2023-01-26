//
//  DataService.swift
//  Recipe List App
//
//  Created by Viorel Harabaru  on 22.01.2023.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
    
        // Get the path to the json file within the app bundle
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // check if pathstring is not equal with nil, otherwilse run the code:
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // create a url object
        //  we can safely unwrap it since the guardian checked for us
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // create a data object
            let data = try Data(contentsOf: url)
            
            // Create a decoder
            let decoder = JSONDecoder()
            
            // Decoding the data with a json decoder
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // add the uniquie ID's
                for i in recipeData {
                    i.id = UUID()
                    
                    // add uniquie IDs to recipe ingredients 
                    for r in i.ingredients {
                        r.id = UUID()
                    }
                }
                
                // Return the recipes:
                return recipeData
            }
            catch {
                // error with parsing json
                print(error)
            }   
        }
        catch {
            /* error with getting data */
            print(error)
        }
    return [Recipe]()
    }

}
