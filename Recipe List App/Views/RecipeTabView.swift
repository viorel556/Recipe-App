//
//  Recipe Tab View.swift
//  [COMPLETED] Recipe List App
//
//  Created by Viorel Harabaru  on 24.01.2023.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        
        TabView {
            
            // 1 tab view contents
            Text("Contents of Featured View")
                .tabItem{
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                        
                    }
                }
            // 2 tab view contents
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
            
        }
    }
}

struct Recipe_Tab_View_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
