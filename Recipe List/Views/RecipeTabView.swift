//
//  RecipeTabView.swift
//  Recipe List
//
//  Created by Brandt Hedgpeth on 4/19/23.
//

import SwiftUI

struct RecipeTabView: View {
    
    @State var tabIndex = 0
    
    var body: some View {
        TabView(selection: $tabIndex) {
            
            Text("Featured View")
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }.tag(0)
            
            RecipeView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("List")
                }.tag(1)
            
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
