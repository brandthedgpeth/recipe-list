//
//  RecipeFeaturedView.swift
//  Recipe List
//
//  Created by Brandt Hedgpeth on 4/21/23.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        
        let featuredRecipes = model.recipes.filter({ $0.featured })
        
        VStack(alignment:.leading, spacing:0) {
            
            Text("Featured Recipes")
                .font(Font.custom("Avenir Heavy",size:30))
                .padding(.leading)
                .padding(.top,40)
                .bold()
            
            GeometryReader { geo in
                TabView(selection: $tabSelectionIndex) {
                    
                    ForEach(0..<featuredRecipes.count, id: \.self) { index in
                        
                        // Recipe Card Button
                        Button(action: {
                            
                            // Show the recipe detail sheet
                            self.isDetailViewShowing = true
                            
                        }, label: {
                            // Recipe card
                            ZStack {
                                
                                Rectangle()
                                    .foregroundColor(.white)
                                
                                VStack {
                                    Image(featuredRecipes[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    Text(featuredRecipes[index].name)
                                        .padding(5)
                                        .font(Font.custom("Avenir",size:17))
                                }
                                
                            }
                        })
                        .tag(index)
                        .buttonStyle(PlainButtonStyle())
                        .frame(width:geo.size.width-40, height:geo.size.height-100, alignment: .center)
                        .cornerRadius(15)
                        .shadow(radius:10)
                }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment:.leading, spacing:10) {
                Text("Preparation Time:")
                    .font(Font.custom("Avenir Heavy",size:18))
                Text(model.recipes[tabSelectionIndex].prepTime)
                    .font(Font.custom("Avenir",size:16))
                Text("Highlights")
                    .font(Font.custom("Avenir Heavy",size:18))
                RecipeHighlights(highlights:model.recipes[tabSelectionIndex].highlights)
            }
            .padding([.leading,.bottom])
        }
        .sheet(isPresented: $isDetailViewShowing) {
            // Show the Recipe Detail View
            RecipeDetailView(recipe: featuredRecipes[tabSelectionIndex])
        }
    }
    
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView().environmentObject(RecipeModel())
    }
}
