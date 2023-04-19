//
//  ContentView.swift
//  Recipe List
//
//  Created by Brandt Hedgpeth on 4/17/23.
//

import SwiftUI

struct RecipeView: View {
    
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
    
        NavigationView {
            List(model.recipes) { r in
               
                NavigationLink(
                    destination: RecipeDetailView(recipe: r),
                    label: {
                        // MARK: Row Item
                        HStack(spacing: 15) {
                            
                            Image(r.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50, alignment:.center)
                                .clipped()
                                .cornerRadius(5)
                            
                            Text(r.name)
                        }
                    })
    
            }
            .navigationBarTitle("All Recipes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
