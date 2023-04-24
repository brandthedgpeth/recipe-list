//
//  RecipeFeaturedView.swift
//  Recipe List
//
//  Created by Brandt Hedgpeth on 4/21/23.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        VStack(alignment:.leading, spacing:0) {
            
            Text("Featured Recipes")
                .font(.largeTitle)
                .padding(.leading)
                .padding(.top,40)
                .bold()
            
            GeometryReader { geo in
                TabView {
                    
                    ForEach(0..<model.recipes.count) { index in
                       
                        // Only show recipes that have featured == true
                        if model.recipes[index].featured {
                            
                            // Recipe card
                            ZStack {
                                
                                Rectangle()
                                    .foregroundColor(.white)
                                
                                VStack {
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    Text(model.recipes[index].name)
                                        .padding(5)
                                }
                                
                            }
                            .frame(width:geo.size.width-40, height:geo.size.height-150, alignment: .center)
                            .cornerRadius(15)
                            .shadow(radius:10)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment:.leading, spacing:10) {
                Text("Preparation Time:")
                    .font(.headline)
                Text("1 hour")
                Text("Highlights")
                    .font(.headline)
                Text("Healthy, Hearty")
            }
            .padding([.leading,.bottom])
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView().environmentObject(RecipeModel())
    }
}
