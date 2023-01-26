//
//  RecipeFeaturedView.swift
//  [COMPLETED] Recipe List App
//
//  Created by Viorel Harabaru  on 26.01.2023.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        Text("Contents of featured view in NEW VIEW")
        
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
    }
}
