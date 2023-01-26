//
//  ContentView.swift
//  Recipe List App
//
//  Created by Viorel Harabaru  on 22.01.2023.
//

import SwiftUI

struct RecipeListView: View {
    
    // Refference the view model
    @ObservedObject var model = RecipeModel()
    
    var body: some View {

        NavigationView {
            List(model.recipes) {i in
                
                
                
                NavigationLink (
                    destination: RecipeDetailView(recipe:i), label: {
                            
                            // MARK: Row item
                            HStack(spacing: 20.0) {
                                Image(i.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50, alignment: .center)
                                    .clipped()
                                    .cornerRadius(5)
                                
                                Text(i.name)
                            }
                    
                })
                
                
            }
            .navigationTitle("All Recipes")
        }
   
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
