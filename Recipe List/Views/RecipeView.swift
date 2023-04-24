//
//  ContentView.swift
//  Recipe List
//
//  Created by Brandt Hedgpeth on 4/17/23.
//

import SwiftUI

struct RecipeView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment:.leading) {
                
                Text("All Recipes")
                    .bold()
                    .font(.largeTitle)
                    .padding(.top,40)
                
                ScrollView {
                    LazyVStack(alignment:.leading) {
                        ForEach(model.recipes) { r in
                            
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
                                            .foregroundColor(.black)
                                    }
                                })
                            
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .padding(.leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView().environmentObject(RecipeModel())
    }
}
