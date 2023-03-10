//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Viorel Harabaru  on 22.01.2023.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    @State var selectedServingSize = 2
    
    var body: some View {
        
        
        ScrollView {
            
            VStack (alignment: .leading) {
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Serving size picker
                
                VStack (alignment: .leading){
                    Text("Select your serving size:")
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 200)
                }

                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    ForEach(recipe.ingredients) {item in 
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
                    }
                }
                .padding(.horizontal)

                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                        
                    
                    ForEach(0..<recipe.directions.count, id:\.self) { index in
                        Text(String(index) + ". " + recipe.directions[index])
                            .padding([.bottom, .top], 5)
                    }
                }
                .padding(.horizontal)
            }
            .navigationBarTitle(recipe.name)
            
            
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // create a dummy recipe and pass it into the detail view;
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
