//
//  RecipeDetailView.swift
//  Recipe List
//
//  Created by Brandt Hedgpeth on 4/18/23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    var body: some View {
        ScrollView {
            VStack(alignment:.leading) {
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Ingredients
                VStack(alignment:.leading) {
                    
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom,.top], 3)
                    
                    ForEach(recipe.ingredients) { item in
                        Text("- " + item.name).padding(.bottom,0.5)
                    }
                }
                .padding(.horizontal)
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment:.leading) {
                    Text("Directions")
                        .font(.headline)
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index + 1) + ". " + recipe.directions[index])
                            .padding([.bottom,.top], 3)
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
        
        // Create a dummy recipe and pass it into the detail view so we can see a preview of it
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
