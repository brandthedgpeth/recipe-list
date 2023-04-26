//
//  RecipeDetailView.swift
//  Recipe List
//
//  Created by Brandt Hedgpeth on 4/18/23.
//

import SwiftUI

struct RecipeDetailView: View {

    @State var selectedServingSize = 2
    
    var recipe:Recipe
    
    var body: some View {
        
        ScrollView {
            VStack(alignment:.leading) {
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Recipe title
                Text(recipe.name)
                    .bold()
                    .padding(.top,20)
                    .padding(.leading)
                    .font(Font.custom("Avenir Heavy",size:30))
                
                // MARK: Serving Size Picker
                VStack(alignment:.leading) {
                    Text("Select your serving size")
                    Picker("Select your serving size", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width:180)
                    .font(Font.custom("Avenir",size:16))
                }
                .padding([.leading,.bottom,.trailing])
                .padding(.top,2)
                // MARK: Ingredients
                VStack(alignment:.leading) {
                    
                    Text("Ingredients")
                        .font(Font.custom("Avenir Heavy",size:18))
                        .padding([.bottom,.top], 3)
                    
                    ForEach(recipe.ingredients) { item in
                        Text("• " + RecipeModel.getPortion(item, recipe.servings, selectedServingSize) + " " + item.name.lowercased())
                            .font(Font.custom("Avenir",size:17))
                    }
                }
                .padding(.horizontal)
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment:.leading) {
                    Text("Directions")
                        .font(Font.custom("Avenir Heavy",size:18))
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index + 1) + ". " + recipe.directions[index])
                            .padding([.bottom,.top], 3)
                            .font(Font.custom("Avenir",size:17))
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe and pass it into the detail view so we can see a preview of it
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[1])
    }
}
